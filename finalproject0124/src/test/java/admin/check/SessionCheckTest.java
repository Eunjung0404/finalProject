package admin.check;

import com.test.finalproject.error.exception.AdminCheckException;
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

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
        "file:src/main/webapp/WEB-INF/spring/security-config.xml",
        "file:src/main/webapp/WEB-INF/spring/tile-define.xml",
        "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class SessionCheckTest {

    @Autowired
    private WebApplicationContext ctx;

    private MockMvc mockMvc;

    @Before
    public void setUp() {
        mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    public void 체크성공() throws Exception {
        MockHttpSession session = new MockHttpSession();
        session.setAttribute("admin", new AdminVo());

        mockMvc.perform(get("/admin/info/list").session(session))
                .andExpect(status().isOk())
                .andExpect(result -> assertEquals(
                        result.getResolvedException(),
                        null)
                );
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    public void 체크실패() throws Exception {
        mockMvc.perform(get("/admin/info/list"))
                .andExpect(status().isNotFound())
                .andExpect(result -> assertEquals(
                        result.getResolvedException().getClass(),
                        AdminCheckException.class)
                );
    }

}
