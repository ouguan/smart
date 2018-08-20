package com.smart.sso.server.controller.admin;

import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.smart.mvc.model.Pagination;
import com.smart.mvc.model.Result;
import com.smart.mvc.model.ResultCode;
import com.smart.mvc.util.StringUtils;
import com.smart.mvc.validator.Validator;
import com.smart.mvc.validator.annotation.ValidateParam;
import com.smart.sso.server.controller.common.BaseController;
import com.smart.sso.server.model.Group;
import com.smart.sso.server.model.User;
import com.smart.sso.server.service.GroupService;
import com.smart.sso.server.service.MembershipService;
import com.smart.sso.server.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.annotations.ApiResponse;

@Api(tags = "组管理")
@Controller
@RequestMapping("/admin/group")
public class GroupController extends BaseController {

    @Resource
    private UserService       userService;
    @Resource
    private GroupService      groupService;
    @Resource
    private MembershipService membershipService;

    @ApiOperation("初始页")
    @RequestMapping(method = RequestMethod.GET)
    public String execute(Model model) {

        return "/admin/group";
    }

    @ApiOperation("新增/修改页")
    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String edit(@ApiParam(value = "id") String id, Model model) {

        Group group;
        if (StringUtils.isBlank(id)) {
            group = new Group();
        } else {
            group = groupService.get(id);
        }
        model.addAttribute("group", group);
        model.addAttribute("userList", getUserList(id));
        return "/admin/groupEdit";
    }

    @ApiOperation("列表")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public @ResponseBody Result list(@ApiParam(value = "组名") String name, @ApiParam(value = "开始页码", required = true) @ValidateParam({ Validator.NOT_BLANK }) Integer pageNo, @ApiParam(value = "显示条数", required = true) @ValidateParam({ Validator.NOT_BLANK }) Integer pageSize) {

        return Result.createSuccessResult().setData(groupService.findPaginationByName(name, new Pagination<Group>(pageNo, pageSize)));
    }

    @ApiOperation("验证登录名")
    @RequestMapping(value = "/validateGroup", method = RequestMethod.POST)
    public @ResponseBody Result validateAccount(@ApiParam(value = "id") String id, @ApiParam(value = "组名", required = true) @ValidateParam({ Validator.NOT_BLANK }) String name) {

        Result result = Result.createSuccessResult();
        Group group = groupService.findByName(name);
        if (null != group && !group.getId().equals(id)) {
            result.setCode(ResultCode.ERROR).setMessage("组名已存在");
        }
        return result;
    }

    @ApiOperation("启用/禁用")
    @RequestMapping(value = "/enable", method = RequestMethod.POST)
    public @ResponseBody Result enable(@ApiParam(value = "ids", required = true) @ValidateParam({ Validator.NOT_BLANK }) String ids, @ApiParam(value = "是否启用", required = true) @ValidateParam({ Validator.NOT_BLANK }) Boolean isEnable) {

        groupService.enable(isEnable, getAjaxIds(ids));
        return Result.createSuccessResult();
    }

    @ApiOperation("新增/修改提交")
    @ApiResponse(response = Result.class, code = 200, message = "success")
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public @ResponseBody Result save(HttpServletRequest request, @ApiParam(value = "id") String id, @ApiParam(value = "组名", required = true) @ValidateParam({ Validator.NOT_BLANK }) String name, @ApiParam(value = "描述 ") String description, @ApiParam(value = "是否启用", required = true) @ValidateParam({ Validator.NOT_BLANK }) Boolean isEnable, @ApiParam(value = "用户ids") String userIds) {

        Group group;
        if (StringUtils.isBlank(id)) {
            group = new Group();
            group.setCreateTime(new Date());
        } else {
            group = groupService.get(id);
        }
        group.setName(name);
        group.setDescription(description);
        group.setIsEnable(isEnable);
        group.updateExtra();
        groupService.save(group, getAjaxIds(userIds));
        return Result.createSuccessResult();
    }

    @ApiOperation("删除")
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public @ResponseBody Result delete(@ApiParam(value = "ids", required = true) @ValidateParam({ Validator.NOT_BLANK }) String ids) {

        groupService.deleteById(getAjaxIds(ids));
        return Result.createSuccessResult();
    }

    private List<User> getUserList(String groupId) {

        Pagination<User> users = new Pagination<User>();
        userService.findPaginationByAccount(null, users);
        if (groupId != null) {
            List<User> listGroupUsers = groupService.listGroupUser(groupId);
            for (User user : users.getList()) {
                boolean isExist = false;
                for (User member : listGroupUsers) {
                    if (user.getId().equals(member.getId())) {
                        isExist = true;
                        break;
                    }
                }
                if (isExist) {
                    user.setIsChecked(true);
                } else {
                    user.setIsChecked(false);
                }
            }
        }
        return users.getList();
    }
}