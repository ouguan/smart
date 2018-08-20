package com.smart.sso.server.controller.admin;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.smart.mvc.config.ConfigUtils;
import com.smart.mvc.exception.ValidateException;
import com.smart.mvc.model.Pagination;
import com.smart.mvc.model.Result;
import com.smart.mvc.model.ResultCode;
import com.smart.mvc.util.StringUtils;
import com.smart.mvc.validator.Validator;
import com.smart.mvc.validator.annotation.ValidateParam;
import com.smart.sso.server.controller.common.BaseController;
import com.smart.sso.server.enums.TrueFalseEnum;
import com.smart.sso.server.model.ProjectUserRole;
import com.smart.sso.server.model.Role;
import com.smart.sso.server.model.User;
import com.smart.sso.server.service.ProjectUserRoleService;
import com.smart.sso.server.service.RoleService;
import com.smart.sso.server.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.annotations.ApiResponse;

/**
 * @author Joe
 */
@Api(tags = "用户管理")
@Controller
@RequestMapping("/admin/user")
public class UserController extends BaseController {

    @Resource
    private UserService            userService;
    @Resource
    private RoleService            roleService;
    @Resource
    private ProjectUserRoleService projectUserRoleService;

    @ApiOperation("初始页")
    @RequestMapping(method = RequestMethod.GET)
    public String execute(Model model) {

        return "/admin/user";
    }

    @ApiOperation("新增/修改页")
    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String edit(@ApiParam(value = "id") String id, Model model) {

        User user;
        if (StringUtils.isBlank(id)) {
            user = new User();
        } else {
            user = userService.get(id);
        }
        model.addAttribute("user", user);
        model.addAttribute("roleList", getRoleList(id));
        return "/admin/userEdit";
    }

    @ApiOperation("列表")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public @ResponseBody Result list(@ApiParam(value = "登录名") String account, @ApiParam(value = "开始页码", required = true) @ValidateParam({ Validator.NOT_BLANK }) Integer pageNo, @ApiParam(value = "显示条数", required = true) @ValidateParam({ Validator.NOT_BLANK }) Integer pageSize) {

        return Result.createSuccessResult().setData(userService.findPaginationByAccount(account, new Pagination<User>(pageNo, pageSize)));
    }

    @ApiOperation("验证登录名")
    @RequestMapping(value = "/validateAccount", method = RequestMethod.POST)
    public @ResponseBody Result validateAccount(@ApiParam(value = "id") String id, @ApiParam(value = "登录名", required = true) @ValidateParam({ Validator.NOT_BLANK }) String account) {

        Result result = Result.createSuccessResult();
        User user = userService.findByAccount(account);
        if (null != user && !user.getId().equals(id)) {
            result.setCode(ResultCode.ERROR).setMessage("登录名已存在");
        }
        return result;
    }

    @ApiOperation("启用/禁用")
    @RequestMapping(value = "/enable", method = RequestMethod.POST)
    public @ResponseBody Result enable(@ApiParam(value = "ids", required = true) @ValidateParam({ Validator.NOT_BLANK }) String ids, @ApiParam(value = "是否启用", required = true) @ValidateParam({ Validator.NOT_BLANK }) Boolean isEnable) {

        userService.enable(isEnable, getAjaxIds(ids));
        return Result.createSuccessResult();
    }

    @ApiOperation("新增/修改提交")
    @ApiResponse(response = Result.class, code = 200, message = "success")
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public @ResponseBody Result save(HttpServletRequest request, @ApiParam(value = "id") String id, @ApiParam(value = "登录名", required = true) @ValidateParam({ Validator.NOT_BLANK }) String account, @ApiParam(value = "密码 ") String password, @ApiParam(value = "邮箱 ") String email, @ApiParam(value = "描述 ") String description, @ApiParam(value = "是否启用", required = true) @ValidateParam({ Validator.NOT_BLANK }) Boolean isEnable, @ApiParam(value = "角色ids") String roleIds) {

        User user;
        if (StringUtils.isBlank(id)) {
            if (StringUtils.isBlank(password)) {
                throw new ValidateException("密码不能为空");
            }
            user = new User();
        } else {
            user = userService.get(id);
        }
        user.setAccount(account);
        user.setPassword(password);
        user.setEmail(email);
        user.setDescription(description);
        user.setIsEnable(isEnable);
        user.updateExtra();
        userService.save(user, getAjaxIds(roleIds));
        return Result.createSuccessResult();
    }

    @ApiOperation("重置密码")
    @RequestMapping(value = "/resetPassword", method = RequestMethod.POST)
    public @ResponseBody Result resetPassword(@ApiParam(value = "ids", required = true) @ValidateParam({ Validator.NOT_BLANK }) String ids) {

        userService.resetPassword(ConfigUtils.getProperty("system.reset.password"), getAjaxIds(ids));
        return Result.createSuccessResult();
    }

    @ApiOperation("删除")
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public @ResponseBody Result delete(@ApiParam(value = "ids", required = true) @ValidateParam({ Validator.NOT_BLANK }) String ids) {

        userService.deleteById(getAjaxIds(ids));
        return Result.createSuccessResult();
    }

    private List<Role> getRoleList(String userId) {

        List<Role> list = roleService.findByAll(TrueFalseEnum.TRUE.getValue());
        if (userId != null) {
            for (Role role : list) {
                Pagination<ProjectUserRole> listAssignment = new Pagination<ProjectUserRole>();
                listAssignment = projectUserRoleService.findByProjectUserRoleId(userId, null, role.getId(), listAssignment);
                if (null != listAssignment && listAssignment.getRowCount() > 0) {
                    role.setIsChecked(true);
                } else {
                    role.setIsChecked(false);
                }
            }
        }
        return list;
    }
}