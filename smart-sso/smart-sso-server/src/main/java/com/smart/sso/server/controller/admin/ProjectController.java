package com.smart.sso.server.controller.admin;

import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
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
import com.smart.sso.server.model.Project;
import com.smart.sso.server.model.ProjectUserRole;
import com.smart.sso.server.model.User;
import com.smart.sso.server.service.ProjectService;
import com.smart.sso.server.service.ProjectUserRoleService;
import com.smart.sso.server.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;

/**
 * @author Joe
 */
@Api(tags = "应用管理")
@Controller
@RequestMapping("/admin/app")
public class ProjectController extends BaseController {

    @Resource
    private UserService            userService;
    @Resource
    private ProjectService         projectService;
    @Resource
    private ProjectUserRoleService projectUserRoleService;

    @ApiOperation("初始页")
    @RequestMapping(method = RequestMethod.GET)
    public String execute() {

        return "/admin/app";
    }

    @ApiOperation("新增/修改页")
    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String edit(@ApiParam(value = "id") String id, Model model) {

        Project project;
        if (StringUtils.isBlank(id)) {
            project = new Project();
        } else {
            project = projectService.get(id);
        }
        model.addAttribute("app", project);
        model.addAttribute("userList", getUserList(id));
        return "/admin/appEdit";
    }

    @ApiOperation("列表")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public @ResponseBody Result list(@ApiParam(value = "名称 ") String name, @ApiParam(value = "开始页码", required = true) @ValidateParam({ Validator.NOT_BLANK }) Integer pageNo, @ApiParam(value = "显示条数", required = true) @ValidateParam({ Validator.NOT_BLANK }) Integer pageSize) {

        return Result.createSuccessResult().setData(projectService.findPaginationByName(name, new Pagination<Project>(pageNo, pageSize)));
    }

    @ApiOperation("验证应用编码")
    @RequestMapping(value = "/validateCode", method = RequestMethod.POST)
    public @ResponseBody Result validateCode(@ApiParam(value = "id") String id, @ApiParam(value = "应用编码", required = true) @ValidateParam({ Validator.NOT_BLANK }) String code) {

        Result result = Result.createSuccessResult();
        Project db = projectService.findByCode(code);
        if (null != db && !db.getId().equals(id)) {
            result.setCode(ResultCode.ERROR).setMessage("应用编码已存在");
        }
        return result;
    }

    @ApiOperation("启用/禁用")
    @RequestMapping(value = "/enable", method = RequestMethod.POST)
    public @ResponseBody Result enable(@ApiParam(value = "ids", required = true) @ValidateParam({ Validator.NOT_BLANK }) String ids, @ApiParam(value = "是否启用", required = true) @ValidateParam({ Validator.NOT_BLANK }) Boolean isEnable) {

        projectService.enable(isEnable, getAjaxIds(ids));
        return Result.createSuccessResult();
    }

    @ApiOperation("新增/修改提交")
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public @ResponseBody Result save(@ApiParam(value = "id") String id, @ApiParam(value = "名称", required = true) @ValidateParam({ Validator.NOT_BLANK }) String name, @ApiParam(value = "应用编码", required = true) @ValidateParam({ Validator.NOT_BLANK }) String code, @ApiParam(value = "描述 ") String description, @ApiParam(value = "是否启用", required = true) @ValidateParam({ Validator.NOT_BLANK }) Boolean enabled,
            @ApiParam(value = "排序", required = true) @ValidateParam({ Validator.NOT_BLANK, Validator.INT }) Integer sort, @ApiParam(value = "用户ids") String userIds) {

        Project project;
        if (StringUtils.isBlank(id)) {
            project = new Project();
            project.setCreateTime(new Date());
        } else {
            project = projectService.get(id);
        }
        project.setName(name);
        project.setDescription(description);
        project.setEnabled(enabled);
        project.setSort(sort);
        project.setCode(code);
        project.updateExtra();
        projectService.save(project, getAjaxIds(userIds));
        return Result.createSuccessResult();
    }

    @ApiOperation("删除")
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public @ResponseBody Result delete(@ApiParam(value = "ids", required = true) @ValidateParam({ Validator.NOT_BLANK }) String ids) {

        projectService.deleteById(getAjaxIds(ids));
        return Result.createSuccessResult();
    }

    private List<User> getUserList(String projectId) {

        Pagination<User> users = new Pagination<User>() ;
        userService.findPaginationByAccount(null, users);
        if (projectId != null) {
            for (User user : users.getList()) {
                Pagination<ProjectUserRole> listAssignment = new Pagination<ProjectUserRole>();
                listAssignment = projectUserRoleService.findByProjectUserRoleId(user.getId(), projectId, null, listAssignment);
                if (null != listAssignment && listAssignment.getRowCount() > 0) {
                    user.setIsChecked(true);
                } else {
                    user.setIsChecked(false);
                }
            }
        }
        return users.getList();
    }
}