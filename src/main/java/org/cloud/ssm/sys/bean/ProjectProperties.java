package org.cloud.ssm.sys.bean;

import org.springframework.stereotype.Component;

@Component
public class ProjectProperties {

    /** 是否开启验证码 */
    private boolean captchaOpen = false;

    public boolean isCaptchaOpen() {
        return captchaOpen;
    }

    public void setCaptchaOpen(boolean captchaOpen) {
        this.captchaOpen = captchaOpen;
    }

}
