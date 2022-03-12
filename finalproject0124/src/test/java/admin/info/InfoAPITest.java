package admin.info;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.test.finalproject.form.AdminInfoForm;
import com.test.finalproject.vo.AdminVo;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
        "file:src/main/webapp/WEB-INF/spring/security-config.xml",
        "file:src/main/webapp/WEB-INF/spring/tile-define.xml",
        "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Transactional
public class InfoAPITest {

    @Autowired
    private WebApplicationContext ctx;

    private MockMvc mockMvc;
    private static final MockHttpSession session = new MockHttpSession();;
    private final ObjectMapper mapper = new ObjectMapper();
    private final AdminInfoForm form = setAdminInfoForm();

    @BeforeClass
    public static void setAdminSession() {
        AdminVo admin = new AdminVo();
        admin.setAlevel(1);

        session.setAttribute("admin", admin);
    }

    @Before
    public void setUp() {
        mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    public void getList() throws Exception {
        mockMvc.perform(get("/admin/info/list").session(session))
                .andExpect(status().isOk());
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    public void postAdmin() throws Exception {
        mockMvc.perform(post("/admin/info")
                .session(session)
                .contentType(MediaType.APPLICATION_JSON)
                .content(mapper.writeValueAsString(form))
            ).andExpect(status().isOk());
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    public void putAdmin() throws Exception {
        mockMvc.perform(put("/admin/info")
                .session(session)
                .contentType(MediaType.APPLICATION_JSON)
                .content(mapper.writeValueAsString(form))
        ).andExpect(status().isOk());
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    public void deleteAdmin() throws Exception {
        mockMvc.perform(delete("/admin/info/test999").session(session))
                .andExpect(status().isOk());
    }

    private static AdminInfoForm setAdminInfoForm() {
        AdminInfoForm admin = new AdminInfoForm();
        admin.setAid("test999");
        admin.setApwd("qwer1234!@");
        admin.setAlevel(1);
        admin.setTheatername("ALL");
        return admin;
    }

}
