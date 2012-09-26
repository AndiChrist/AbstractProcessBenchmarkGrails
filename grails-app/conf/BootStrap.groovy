import abstractprocessbenchmarkgrails.*

class BootStrap {

    def init = { servletContext ->

        // Role
        def user = new Role(description:"User")
        user.save()
        def admin = new Role(description:"Admin")
        admin.save()
        
        // User
        def andi = new User(firstName:"Andreas", lastName:"Christ", login:"ach", password:"ach", role:admin)
        def michael = new User(firstName:"Michael", lastName:"Kügeler", login:"mkü", password:"mkü", role:user)
        andi.save()
        michael.save()
        new User(firstName:"Andreas", lastName:"Behrens", login:"abe", password:"abe", role:user).save()
        
        // System
        def s_file = new System(description:"File")
        s_file.save()
        def s_cms = new System(description:"CMS")
        s_cms.save()
        def s_sap = new System(description:"SAP")
        s_sap.save()
        def s_sigos = new System(description:"SIGOS")
        s_sigos.save()
        def s_citrix = new System(description:"Citrix")
        s_citrix.save()
        def s_email = new System(description:"Email")
        s_email.save()
        def s_clarity = new System(description:"Clarity")
        s_clarity.save()
        
        // Media
        def m_file = new Media(description:"File")
        m_file.save()
        def m_web = new Media(description:"Webapplication")
        m_web.save()
        def m_mail = new Media(description:"Email")
        m_mail.save()
        
        // View
        def implicit = new View(description:"Implicit")
        implicit.save()
        def explicit = new View(description:"Explicit")
        explicit.save()
        
        // Layer
//        def l_1 = new Layer(description:"Preparation", level:1)
//        def l_2 = new Layer(description:" Execution", level:1)
//        
//        def l_11 =  new Layer(description:"Create Template", level:2)
//
//        def l_21 =  new Layer(description:"Check for new Tasks", level:2)
//        def l_22 =  new Layer(description:"Test Configuration in SIGOS", level:2)
//        def l_23 =  new Layer(description:"Test Execution in SIGOS", level:2)
//        def l_24 =  new Layer(description:"Trouble Shooting", level:2)
//
//        def l_111 = new Layer(description:"Go to CMS to get the template", level:3)
//        def l_112 =  new Layer(description:"Fill in data got from test book", level:3)
//        def l_113 =  new Layer(description:"Create Folder for Customer", level:3)
//        def l_114 =  new Layer(description:"Upload template to CMS", level:3)
//        
//        def l_211 =  new Layer(description:"filter pending tasks in activity dashboard", level:3)
//        def l_212 =  new Layer(description:"Update task status into ongoing", level:3)
//        def l_213 =  new Layer(description:"Check testing methodology (automated?)", level:3)
//        def l_214 =  new Layer(description:"Check testbooks for testing agreement", level:3)
//        
//        def l_221 =  new Layer(description:"Login into SIGOS", level:3)
//        def l_222 =  new Layer(description:"Selecting the test cases", level:3)
//        def l_223 =  new Layer(description:"Create Folders in SIGOS", level:3)
//        def l_224 =  new Layer(description:"Collect details for test setup (IR21)", level:3)
//        def l_225 =  new Layer(description:"fill in test details in test case forms", level:3)
//        
//        def l_231 =  new Layer(description:"Schedule tests", level:3)
//        def l_232 =  new Layer(description:"Wait for results", level:3)
//        def l_233 =  new Layer(description:"Review test results", level:3)
//        def l_234 =  new Layer(description:"Repeat of failed cases", level:3)
//        def l_235 =  new Layer(description:"Change configuration", level:3)
//        
//        def l_236 =  new Layer(description:"Iteration 3: repeat of failed cases", level:3)
//        def l_237 =  new Layer(description:"Review test results", level:3)
//        def l_238 =  new Layer(description:"Write email to HPLMN/VPLMN/HUB", level:3)
//        def l_239 =  new Layer(description:"Update task notes section in clarity", level:3)
//        
//        def l_241 =  new Layer(description:"Login into Citrix farm", level:3)
//        def l_242 =  new Layer(description:"Browse page of testing tool", level:3)
//        def l_243 =  new Layer(description:"Login into tracing tool", level:3)
//        def l_244 =  new Layer(description:"Open a trace", level:3)
//        
//        def l_245 =  new Layer(description:"Wait for reply of HPLMN/VPLMN/HUB", level:3)
//
////        l_1.subordinates = [ l_11 ]
////        l_2.subordinates = [ l_21, l_22, l_23, l_24 ]
////        
////        l_11.subordinates = [ l_111, l_112, l_113, l_114 ]
////        l_21.subordinates = [ l_211, l_212, l_213, l_214 ]
////        l_22.subordinates = [ l_221, l_222, l_223, l_224, l_225 ]
////        l_23.subordinates = [ l_231, l_232, l_233, l_234, l_235, l_236, l_237, l_238, l_239 ]
////        l_24.subordinates = [ l_241, l_242, l_243, l_244, l_245 ]
//        
//        l_1.save()
//        l_2.save()
//        l_11.save()
//        l_21.save()
//        l_22.save()
//        l_23.save()
//        l_24.save()
//        l_111.save()
//        l_112.save()
//        l_113.save()
//        l_114.save()
//        l_211.save()
//        l_212.save()
//        l_213.save()
//        l_214.save()
//        l_221.save()
//        l_222.save()
//        l_223.save()
//        l_224.save()
//        l_225.save()
//        l_231.save()
//        l_232.save()
//        l_233.save()
//        l_234.save()
//        l_235.save()
//        l_236.save()
//        l_237.save()
//        l_238.save()
//        l_239.save()
//        l_241.save()
//        l_242.save()
//        l_243.save()
//        l_244.save()
//        l_245.save()

        // Service
        def gprs = new Service(description:"GPRS")
        gprs.save()



        
        // Domain
        def domain_1 = new Domain(name:"Domain 1")
        domain_1.save()

        
        // Process
        def process_1 = new Process(alias:"IREG", description:"IREG automated", domain:domain_1)
        def process_2 = new Process(alias:"Process 2", description:"Mega process", domain:domain_1)
        process_1.save()
        process_2.save()

        // Session    
        def session_1 = new Session(startDate:new Date(), sessionOwner:andi, description:"Session 1", process:process_1)
        def session_2 = new Session(startDate:new Date(), sessionOwner:michael, description:"Session 2", process:process_1)
        def session_3 = new Session(startDate:new Date(), sessionOwner:michael, description:"Session 3", process:process_1)
        session_1.save()
        session_2.save()
        session_3.save()
        
        // Task (with layer)
//        new Task(session:session_1, sequence:1, layer1:l_1, layer2:l_11, layer3:l_111, role:user, user:michael, system:s_file, media:m_file, view:implicit, description:"A").save()
//        new Task(session:session_1, sequence:2, layer1:l_1, layer2:l_11, layer3:l_111, role:user, user:michael, system:s_file, media:m_file, view:implicit, description:"B").save()
//        new Task(session:session_1, sequence:3, layer1:l_1, layer2:l_11, layer3:l_112, role:user, user:michael, system:s_cms, media:m_web, view:implicit, description:"C").save()
//        new Task(session:session_1, sequence:4, layer1:l_1, layer2:l_11, layer3:l_113, role:user, user:michael, system:s_cms, media:m_web, view:implicit, description:"D").save()
//        new Task(session:session_1, sequence:5, layer1:l_2, layer2:l_21, layer3:l_211, role:user, user:michael, system:s_sap, media:m_web, view:implicit, description:"E").save()
//        new Task(session:session_1, sequence:6, layer1:l_2, layer2:l_21, layer3:l_212, role:user, user:michael, system:s_sap, media:m_web, view:implicit, description:"F").save()
//        new Task(session:session_1, sequence:7, layer1:l_2, layer2:l_21, layer3:l_213, role:user, user:michael, system:s_sap, media:m_web, view:implicit, description:"G").save()
//        new Task(session:session_1, sequence:8, layer1:l_2, layer2:l_21, layer3:l_214, role:user, user:michael, system:s_cms, media:m_web, view:implicit, description:"H").save()
//        new Task(session:session_1, sequence:9, layer1:l_2, layer2:l_22, layer3:l_221, role:user, user:michael, system:s_sigos, media:m_web, view:implicit, description:"I").save()
//        new Task(session:session_1, sequence:10, layer1:l_2, layer2:l_22, layer3:l_222, role:user, user:michael, system:s_sigos, media:m_web, view:implicit, description:"J").save()
//        new Task(session:session_1, sequence:11, layer1:l_2, layer2:l_22, layer3:l_223, role:user, user:michael, system:s_sigos, media:m_web, view:implicit, description:"K").save()
//        new Task(session:session_1, sequence:12, layer1:l_2, layer2:l_22, layer3:l_224, role:user, user:michael, system:s_file, media:m_file, view:implicit, description:"L").save()
//        new Task(session:session_1, sequence:13, layer1:l_2, layer2:l_22, layer3:l_225, role:user, user:michael, system:s_sigos, media:m_web, view:implicit, description:"M").save()
//        new Task(session:session_1, sequence:14, layer1:l_2, layer2:l_23, layer3:l_231, role:user, user:michael, system:s_sigos, media:m_web, view:implicit, description:"N").save()
//        new Task(session:session_1, sequence:15, layer1:l_2, layer2:l_23, layer3:l_232, role:user, user:michael, system:s_sigos, media:m_web, view:explicit, description:"O").save()
//        new Task(session:session_1, sequence:16, layer1:l_2, layer2:l_23, layer3:l_233, role:user, user:michael, system:s_sigos, media:m_web, view:implicit, description:"P").save()
//        new Task(session:session_1, sequence:17, layer1:l_2, layer2:l_23, layer3:l_234, role:user, user:michael, system:s_sigos, media:m_web, view:explicit, description:"Q").save()
//        new Task(session:session_1, sequence:18, layer1:l_2, layer2:l_23, layer3:l_235, role:user, user:michael, system:s_sigos, media:m_web, view:implicit, description:"R").save()
//        new Task(session:session_1, sequence:19, layer1:l_2, layer2:l_24, layer3:l_241, role:user, user:michael, system:s_citrix, media:m_web, view:implicit, description:"S").save()
//        new Task(session:session_1, sequence:20, layer1:l_2, layer2:l_24, layer3:l_242, role:user, user:michael, system:s_citrix, media:m_web, view:implicit, description:"T").save()
//        new Task(session:session_1, sequence:21, layer1:l_2, layer2:l_24, layer3:l_243, role:user, user:michael, system:s_citrix, media:m_web, view:implicit, description:"U").save()
//        new Task(session:session_1, sequence:22, layer1:l_2, layer2:l_24, layer3:l_244, role:user, user:michael, system:s_citrix, media:m_web, view:implicit, description:"V").save()
//        new Task(session:session_1, sequence:23, layer1:l_2, layer2:l_23, layer3:l_236, role:user, user:michael, system:s_sigos, media:m_web, view:implicit, description:"W").save()
//        new Task(session:session_1, sequence:24, layer1:l_2, layer2:l_23, layer3:l_237, role:user, user:michael, system:s_sigos, media:m_web, view:implicit, description:"X").save()
//        new Task(session:session_1, sequence:25, layer1:l_2, layer2:l_23, layer3:l_238, role:user, user:michael, system:s_email, media:m_mail, view:implicit, description:"Y").save()
//        new Task(session:session_1, sequence:26, layer1:l_2, layer2:l_23, layer3:l_239, role:user, user:michael, system:s_clarity, media:m_web, view:implicit, description:"Z").save()
//        new Task(session:session_1, sequence:27, layer1:l_2, layer2:l_24, layer3:l_245, role:user, user:michael, system:s_email, media:m_mail, view:explicit, description:"AA").save()

        new Task(process:process_1, sequence:1,  role:user, taskOwner:michael, system:s_file,    media:m_file, view:implicit, description:"A").save()
        new Task(process:process_1, sequence:2,  role:user, taskOwner:michael, system:s_file,    media:m_file, view:implicit, description:"B").save()
        new Task(process:process_1, sequence:3,  role:user, taskOwner:michael, system:s_cms,     media:m_web,  view:implicit, description:"C").save()
        new Task(process:process_1, sequence:4,  role:user, taskOwner:michael, system:s_cms,     media:m_web,  view:implicit, description:"D").save()
        new Task(process:process_1, sequence:5,  role:user, taskOwner:michael, system:s_sap,     media:m_web,  view:implicit, description:"E").save()
        new Task(process:process_1, sequence:6,  role:user, taskOwner:michael, system:s_sap,     media:m_web,  view:implicit, description:"F").save()
        new Task(process:process_1, sequence:7,  role:user, taskOwner:michael, system:s_sap,     media:m_web,  view:implicit, description:"G").save()
        new Task(process:process_1, sequence:8,  role:user, taskOwner:michael, system:s_cms,     media:m_web,  view:implicit, description:"H").save()
        new Task(process:process_1, sequence:9,  role:user, taskOwner:michael, system:s_sigos,   media:m_web,  view:implicit, description:"I").save()
        new Task(process:process_1, sequence:10, role:user, taskOwner:michael, system:s_sigos,   media:m_web,  view:implicit, description:"J").save()
        new Task(process:process_1, sequence:11, role:user, taskOwner:michael, system:s_sigos,   media:m_web,  view:implicit, description:"K").save()
        new Task(process:process_1, sequence:12, role:user, taskOwner:michael, system:s_file,    media:m_file, view:implicit, description:"L").save()
        new Task(process:process_1, sequence:13, role:user, taskOwner:michael, system:s_sigos,   media:m_web,  view:implicit, description:"M").save()
        new Task(process:process_1, sequence:14, role:user, taskOwner:michael, system:s_sigos,   media:m_web,  view:implicit, description:"N").save()
        new Task(process:process_1, sequence:15, role:user, taskOwner:michael, system:s_sigos,   media:m_web,  view:explicit, description:"O").save()
        new Task(process:process_1, sequence:16, role:user, taskOwner:michael, system:s_sigos,   media:m_web,  view:implicit, description:"P").save()
        new Task(process:process_1, sequence:17, role:user, taskOwner:michael, system:s_sigos,   media:m_web,  view:explicit, description:"Q").save()
        new Task(process:process_1, sequence:18, role:user, taskOwner:michael, system:s_sigos,   media:m_web,  view:implicit, description:"R").save()
        new Task(process:process_1, sequence:19, role:user, taskOwner:michael, system:s_citrix,  media:m_web,  view:implicit, description:"S").save()
        new Task(process:process_1, sequence:20, role:user, taskOwner:michael, system:s_citrix,  media:m_web,  view:implicit, description:"T").save()
        new Task(process:process_1, sequence:21, role:user, taskOwner:michael, system:s_citrix,  media:m_web,  view:implicit, description:"U").save()
        new Task(process:process_1, sequence:22, role:user, taskOwner:michael, system:s_citrix,  media:m_web,  view:implicit, description:"V").save()
        new Task(process:process_1, sequence:23, role:user, taskOwner:michael, system:s_sigos,   media:m_web,  view:implicit, description:"W").save()
        new Task(process:process_1, sequence:24, role:user, taskOwner:michael, system:s_sigos,   media:m_web,  view:implicit, description:"X").save()
        new Task(process:process_1, sequence:25, role:user, taskOwner:michael, system:s_email,   media:m_mail, view:implicit, description:"Y").save()
        new Task(process:process_1, sequence:26, role:user, taskOwner:michael, system:s_clarity, media:m_web,  view:implicit, description:"Z").save()
        new Task(process:process_1, sequence:27, role:user, taskOwner:michael, system:s_email,   media:m_mail, view:explicit, description:"AA").save()
        
    }
    def destroy = {
    }
    
}
