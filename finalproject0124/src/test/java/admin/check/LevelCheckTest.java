package admin.check;

import com.test.finalproject.error.exception.AdminLevelCheckException;
import com.test.finalproject.vo.AdminVo;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
        "file:src/main/webapp/WEB-INF/spring/security-config.xml",
        "file:src/main/webapp/WEB-INF/spring/tile-define.xml",
        "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class LevelCheckTest {

    @Autowired
    private WebApplicationContext wac;

    private MockMvc mockMvc;
    private MockHttpSession session;

    @Before
    public void setUp() {
        AdminVo admin = new AdminVo();
        admin.setAlevel(2);

        session = new MockHttpSession();
        session.setAttribute("admin", admin);

        mockMvc = MockMvcBuilders.webAppContextSetup(wac).build();
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    public void 체크성공() throws Exception {
        mockMvc.perform(get("/admin/theater/강남").session(session))
                .andExpect(status().isOk());
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    public void 체크실패() throws Exception {
        mockMvc.perform(get("/admin/theater/ALL").session(session))
                .andExpect(result -> result
                        .getResolvedException()
                        .getClass()
                        .isAssignableFrom(AdminLevelCheckException.class));
    }

}
