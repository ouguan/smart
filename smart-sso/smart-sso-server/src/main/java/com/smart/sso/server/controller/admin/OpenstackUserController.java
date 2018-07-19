package com.smart.sso.server.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.smart.sso.server.controller.common.BaseController;
import io.swagger.annotations.Api;

@Api(tags = "Openstck用户管理")
@Controller
@RequestMapping("/openstack/user")
public class OpenstackUserController extends BaseController {
}