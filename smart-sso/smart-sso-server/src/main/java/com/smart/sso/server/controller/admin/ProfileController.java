package com.smart.sso.server.controller.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.openstack4j.model.identity.v3.Token;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.smart.mvc.model.Result;
import com.smart.mvc.model.ResultCode;
import com.smart.mvc.validator.Validator;
import com.smart.mvc.validator.annotation.ValidateParam;
import com.smart.sso.client.SessionUtils;
import com.smart.sso.server.common.TokenManager;
import com.smart.sso.server.controller.common.BaseController;
import com.smart.sso.server.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;

/**
 * @author Joe
 */
@Api(tags = "个人中心")
@Controller
@RequestMapping("/admin/profile")
public class ProfileController extends BaseController {

	@Resource
	private TokenManager tokenManager;
	@Resource
	private UserService userService;

	@ApiOperation("初始页")
	@RequestMapping(method = RequestMethod.GET)
	public String execute(Model model, HttpServletRequest request) {
		//Token token = tokenManager.validate(SessionUtils.getSessionUser(request).getToken());
		if (token != null) {
			model.addAttribute("user", getLoginUser());
		}
		return "/admin/profile";
	}

	@ApiOperation("修改密码提交")
	@RequestMapping(value = "/savePassword", method = RequestMethod.POST)
	public @ResponseBody Result save(
			@ApiParam(value = "新密码", required = true) @ValidateParam({ Validator.NOT_BLANK }) String newPassword,
			@ApiParam(value = "确认密码", required = true) @ValidateParam({ Validator.NOT_BLANK }) String confirmPassword,
			HttpServletRequest request) {
	    Token token = tokenManager.validate(SessionUtils.getSessionUser(request).getToken());
		if (token != null) {
			userService.updatePassword(token.getUser().getId(), newPassword);
			return Result.createSuccessResult().setMessage("修改成功");
		}
		else {
			return Result.create(ResultCode.VALIDATE_ERROR).setMessage("修改失败");
		}
	}
}