library(shiny)
library(shinydashboard)
library(readxl)
library(shinythemes)
library(catR)
library(shinyBS)
library(shinyjs)
library(googlesheets4)
library(dplyr)
library(shinydashboardPlus)
library(shinyWidgets)
library(ggplot2)
library(DBI)
library(dbplyr)
library(RMySQL)
library(writexl)
library(shinyalert)
library(shinyhelper)


ui <- dashboardPage(
                    dashboardHeader(
                      
                       tags$li(class = "dropdown", 
                              tags$br(style = "margin-top: 0px; margin-bottom: 0px;"),
                           
                             div(id='aboutusboxout', actionBttn(inputId ="contact",label = "About Us",size="sm",color="default",block = TRUE,style="stretch",icon = icon("user", lib = "glyphicon"))),
                             
                             hidden(div(id='backaccountboxout', actionBttn(inputId ="backtoaccount",label = "Back to Account",size="sm",color="default",block = TRUE,style="stretch",icon = icon("user", lib = "glyphicon")))),
                             
                             hidden(div(id='homepageboxout', actionBttn(inputId ="homepage",label = "Home Page",size="sm",color="default",block = TRUE,style="stretch",icon = icon("user", lib = "glyphicon"))))
                             )
                  
                    ),
                    shinydashboard::dashboardSidebar( disable = T),
 
                    dashboardBody(
          
                      useShinyjs(),
                                  
                      tags$head(tags$style(HTML('
                                  /* logo */
                                .skin-blue .main-header .logo {
                                background-color: #666666;
                                }

                                /* navbar (rest of the header) */
                                .skin-blue .main-header .navbar {
                                background-color: #666666;
                                }'
                                                ))),
                                  
                                  tags$style(
                                    HTML("
                                    
                                    .center-content {
                                                      display: flex;
                                                      flex-direction: column;
                                                      align-items: center;
                                                     
                                                      margin-bottom: 150px;
                                                      margin-top: 5px:}
                                      .center-text {
                                                      
                                                      justify-content: center;
                                                      align-items: center;
                                                      height: 33; }
                          .text-area-class textarea {
                                                      font-size: 30px;
                                                      height: 50px; 
                                                      width: 150%; 
                                                      align=center;
                                                      margin-bottom: 10px;}
                                         
                           .text-area-class2 textarea {
                                                      font-size: 20px;
                                                      height: 100px; 
                                                      width: 150%; 
                                                      align=center;
                                                      margin-bottom: 10px;}
                                                      
              .box.box-solid.box-primary>.box-header {
                                                      color:#fff;
                                                      background:#666666}

                           .box.box-solid.box-primary{
                                                      border-bottom-color:#666666;
                                                      border-left-color:#666666;
                                                      border-right-color:#666666;
                                                      border-top-color:#666666;}

                                         ")),
                                  
                               
                                  tags$style(
                                    HTML(
                                      "#saveadmin {
                                                  width: 100%; 
                                                  margin: 0 auto;
                                                  background-color: #666666;
                                                  color: white;
                                                  font-weight: bold;}
                                      
                                    #submit_login {
                                                  width: 45%; 
                                                  lef-margin: 200px;
                                                  background-color: #666666;
                                                  color: white;
                                                  font-weight: bold;}
                                                  
                                      #saveconfig {
                                                  width: 70%; 
                                                  margin: 0 auto;
                                                  background-color: #666666;
                                                  color: white;
                                                  font-weight: bold;}
                                                  
                       
                                            ")),
                                  
                                  
                                  tags$style(HTML("
                                  .footer-section {
                                                   position: fixed;
                                                   bottom: 0;
                                                   width: 100%;
                                                   background-color: #707070;
                                                   border-top: 2px solid #ccc;
                                                   z-index: 9999;
                                                   text-align: center;}
                              .footer-section img {
                                                   margin: 0 10px;
                                                   height: 25px;
                                                   width: 25px;}
                                       .copyright {
                                                   display: inline-block;
                                                   margin-right: auto;
                                                   margin-left: 330px;
                                                   color: white; /* Telif hakkı metninin rengi */
                                                   text-align: left; /* Metni ortala */
                                                  
                                                   padding-right: 100px;}
                                     .right-logos {
                                                   float: right;
                                                   margin-right: 75px;}
                                              ")),

                                  ## FOOTER CODES ##
                                  div(
                                    class = "footer-section",
                                    div(class = "copyright", "© 2024 | All rights reserved"),

                                    div(class = "right-logos",
                                        tags$a(href = "https://www.linkedin.com/in/huseyin-yildiz-923281202/?locale=en_US/", target = "_blank",
                                               tags$img(src = "linkedin.png", alt = "LinkedIn")),

                                        tags$a(href = "https://www.researchgate.net/profile/Huseyin-Yildiz-6/", target = "_blank",
                                               tags$img(src = "researchgate.png", alt = "Researchgate")),

                                        tags$a(href = "https://www.youtube.com/channel/UCgUfq2b0zJQ9Tkl5NjGPDdQ/", target = "_blank",
                                               tags$img(src = "youtube.png", alt = "YouTube"))
                                    )),
                                  ######################
                                  
          
                                  fluidRow(
                                    
                                    tags$style(HTML(" .content-wrapper {background-color: #EFEFEF;}")), ## MAIN BACKGROUND COLOUR
                                  
                                    useShinyjs(),
              
                                    div(id="baykusboxout", ## MAIN LOGO
                                        img(src="QuiCAT.png", 
                                            width="22%", 
                                            height="22%"),
                                        style="text-align: center;"),tags$hr(style = "margin-top: 1px; margin-bottom: 5x;"),
                                    
                                    
                                    div(id="stepboxout",  ## HOME PAGE HOW TO USE IMAGE
                                        img(src="step.png", 
                                            width="60%", 
                                            height="60%"),
                                        style="text-align: center;"),

              column(width = 12,     
                             
                   column(width = 8,     
                                    
                         hidden(div(id="template_tutorial_boxout",  ## CREATE / EDIT ITEM BANK
                                    img(src="bank_guide.png", 
                                        width="100%", 
                                        height="100%"),
                                        style="text-align: left;margin-left: 100px;"))
                   ), 
                   
                   column(width = 4,
                          
                         hidden(div(id = "add_item_boxout",
                                    downloadBttn(
                                      outputId = "download_template",
                                      label = img(src="download_template.png", 
                                                  width="83%", 
                                                  height="83%"),
                                      size = "md",
                                      color = 'default' ,
                                      block = TRUE,
                                      icon='',
                                      style = "pill"
                                    ),tags$hr(style = "margin-top: 10px; margin-bottom: 5x;"),
                                    
                                    
                                    actionBttn(inputId = "template_popup",
                                               label=img (src="template_guide.png", 
                                                          width="83%", 
                                                          height="83%"),
                                               size="sm",
                                               color="default",
                                               block = TRUE,
                                               style="pill",
                                               no_outline = T))),tags$hr(style = "margin-top: 10px; margin-bottom: 5x;"),
                         hidden( div( id="itembankinfo2",
                                              htmlOutput("itembankinfo2"))),
                                                  
                         hidden( div(id = "add_item_boxout2",  
                                                             box(title='Upload Item Bank',status = 'primary',solidHeader = TRUE,
                                                                              fileInput("item_bank", "Choose File", 
                                                                                         placeholder="Browse",
                                                                                         buttonLabel = "Add",
                                                                                         accept = c("xlsx","xls","csv")),width = 12)))
                       )),
              
                                    div(id="mainboxout",
                                               
                                        column(width = 6,
                                               column(width = 8),
                                               column(width = 4, 
                                                     
                                                      div(id = "adminboxout",
                                                          actionBttn(inputId = "adminbutton",
                                                                     label= img(src="signup_icon.png", 
                                                                                width="64%", 
                                                                                height="64%"),
                                                                                size="sm",
                                                                                color="default",
                                                                                block = TRUE,
                                                                                style="pill",
                                                                                no_outline = T)))),
                                        
                                        column(width = 6,
                                                column(width = 1),
                                                column(width = 4, 
                                                     
                                                      div( id = "loginboxout",
                                                           
                                                           actionBttn(inputId = "login_button",
                                                                      label=img (src="login_icon.png", 
                                                                                 width="64%", 
                                                                                 height="64%"),
                                                                                 size="sm",
                                                                                 color="default",
                                                                                 block = TRUE,
                                                                                 style="pill",
                                                                                 no_outline = T)))) ,style="text-align: center;"),
                                    
                                   hidden(div(id="login_boxout",
                                        
                                        column(width =6,
                                        column(width = 6),
                                        column(width = 6, 
  
                                                      div(id = "create_bank_boxout",
                                                           actionBttn(inputId = "create_bank_button",
                                                                      label= img (src="bank.png", 
                                                                                  width="65%", 
                                                                                  height="65%"),
                                                                                  size="sm",
                                                                                  color="default",
                                                                                  block = TRUE,
                                                                                  style="pill",
                                                                                  no_outline = T), tags$hr(style = "margin-top: 5px; margin-bottom: 5x;"),
                                                           
                                                          actionBttn(inputId = "resultbutton",
                                                                   
                                                                       label=img (src="summary.png", 
                                                                                width="65%", 
                                                                                height="65%"),
                                                                                size="sm",
                                                                                color="default",
                                                                                block = TRUE,
                                                                                style="pill",
                                                                                no_outline = T)),
                                               )),
                                        
                                        column(width = 6,
                                        # column(width = 1),
                                        column(width = 6, 
                                                     
                                                      div(id = "resultboxout",
                                                          
                                                         actionBttn(inputId = "setting",
                                                                    label=img (src="settings.png", 
                                                                               width="65%", 
                                                                               height="65%"),
                                                                               size="sm",color="default",
                                                                               block = TRUE,
                                                                               style="pill",
                                                                               no_outline = T), tags$hr(style = "margin-top: 5px; margin-bottom: 5x;"),
                                                         
                                                         actionBttn(inputId = "result2button",
                                                                    label=img (src="individual.png", 
                                                                               width="65%", 
                                                                               height="65%"),
                                                                               size="sm",
                                                                               color="default",
                                                                               block = TRUE,
                                                                               style="pill",
                                                                               no_outline = T)))) ,style="text-align: center;" )),
                                   
                                   hidden( div(id="authboxout", 
                                               
                                               column(width = 12,
                                               column(width =5),
                                               column(width = 6,
                                                      
                                                  
                                                          div( shiny::textAreaInput("login_user", label = div("Test ID"), rows=1 ), style="text-align: left; font-size: 25px;", class = "text-area-class"),
                                                          div( shiny::textAreaInput("login_pass", label = div("Password"), rows=1 ),  style="text-align: left; font-size: 25px;",class = "text-area-class"),
                                                          tags$hr(style = "margin-top: 5px; margin-bottom: 5x;"),
                                                                           # 
                                                                           # textInput(inputId = "login_user", label = "Test ID",width = '100%'),
                                                                           # textInput(inputId = "login_pass", label = "Password",width = '100%'),
                                                       
                                                             actionBttn(inputId ="submit_login",
                                                                        label = "Log In",
                                                                        size="md",
                                                                        color="primary",
                                                                        block = TRUE,
                                                                        style="pill"),tags$hr(style = " margin-bottom: 15x;")),
                                                column(width = 4)))),
                                                column(width = 12,
                                             
                            hidden( div(   class = "center-content",
                                        id="surveyboxout",
                                    
                   div( shiny::textAreaInput("testid", label = div(h3("Test ID")), rows=1 ), class = "text-area-class"),
                   div( shiny::textAreaInput("password", label = div(h3("Password")), rows=1 ), class = "text-area-class"),
                   div( shiny::textAreaInput("password_confirm", label = div(h3("Confirm Password")), rows=1 ), class = "text-area-class"),
                   div( shiny::textAreaInput("email", label = div(h3("E-mail Adress")), rows=1 ), class = "text-area-class"),
                   div( shiny::textAreaInput("full_name", label = div(h3("Full Name")), rows=1 ), class = "text-area-class"),
                   div( shiny::textAreaInput("institution", label = div(h3("Institution")), rows=1 ), class = "text-area-class"),
                   div( shiny::textAreaInput("aim", label = div(h3("Information About the Test")), rows=4 ), class = "text-area-class2"),hr(),
                  div(actionBttn(inputId = "saveadmin",label="Create Account",size="md",color="primary",block = TRUE, style = "pill"),style=" margin-left: 100px")

                                                                                   
                                                  )),
                   ),
                                   
                                   ###############
    
                                column(width = 12,
                                       
                                       column(width = 2),
                                       
                                       column(width = 8,
                                hidden(div(id="configboxout",box(title = "Adaptive Test Settings",status = "primary",solidHeader = TRUE,width = 12,
                                radioButtons(inputId = "starttest", label = "Starting Rule Type",choices = c("Exact Theta","Theta Interval"),selected = "Exact Theta"),
                                conditionalPanel(condition="input.starttest == 'Exact Theta'",sliderInput(inputId = "start1", label="Exact Theta Level To Start",min=-3,max = 3,value = 0,step = 0.1)),
                                conditionalPanel(condition="input.starttest == 'Theta Interval'",sliderInput(inputId = "start2", label="Theta Interval Level To Start",min=-3,max = 3,value = c(-0.5,0.5),step = 0.1)),  
                                                                                   
                         
                                selectInput(inputId = "itemselect",
                                             label = 'Item Selection Rule',
                                             choices = c("MFI - Maximum Fisher Information",
                                                        "MLWI - Maximum Likelihood Weighted Information (Veerkamp and Berger, 1997)",
                                                        "MPWI - Maximum Posterior Weighted Information (van der Linden, 1998)",
                                                        "MEI - Maximum Expected Information (van der Linden, 1998)",
                                                        "KL - Kullback-Leibler Divergency Criterion  (Chang and Ying, 1996)",
                                                        "KLP - Posterior Kullback-Leibler Criterion  (Chang and Ying, 1996)",
                                                        "GDI -  Global-Discrimination Index (Kaplan, de la Torre, and Barrada, 2015)",
                                                        "GDIP - Posterior Global-Discrimination Index (Kaplan, de la Torre, and Barrada, 2015)",
                                                        "MEPV - Minimum Expected Posterior Variance",
                                                        "random"),
                                            selected = "MFI - Maximum Fisher Information"),
                 
                                
                                selectInput(inputId = "estimationrule",
                                            label = 'Estimation Method During the Test', 
                                            choices = c( "EAP - Expected A Posteriori (Bock and Mislevy, 1982)",
                                                         "ML - Maximum Likelihood (Lord, 1980)",
                                                         "WL - Weighted Likelihood (Warm, 1989)",
                                                         "BM - Bayes Modal (Birnbaum, 1969)"),
                                            selected = "EAP - Expected A Posteriori (Bock and Mislevy, 1982)"), 
                                
                                selectInput(inputId = "finalestimation",
                                            label = 'Final Ability Estimation Method', 
                                            choices = c("EAP - Expected A Posteriori (Bock and Mislevy, 1982)",
                                                        "ML - Maximum Likelihood (Lord, 1980)",
                                                        "WL - Weighted Likelihood (Warm, 1989)",
                                                        "BM - Bayes Modal (Birnbaum, 1969)"),
                                           selected = "ML - Maximum Likelihood (Lord, 1980)"), 
                                                                                   
                                radioButtons(inputId = "terminate", label = "Termination Rule Type",choices = c("Fixed Test Length","Standart Error Based"),selected = "Fixed Test Length"),
                                conditionalPanel(condition="input.terminate == 'Fixed Test Length'", sliderInput(inputId = "terminate1", label="Fixed Test Length",min=5,max = 100,value =20,step =1)),
                                conditionalPanel(condition="input.terminate == 'Standart Error Based'", sliderInput(inputId = "terminate2", label="Standart Error Cut Off",min=0.05,max =1,value =0.3,step =0.05)),
                                # checkboxInput("show_inputs", "Apply Content Balancing"),
                                # uiOutput("inputs"),hr(),
                                textInput(inputId = "beforemessage", label = "Message Before Test",placeholder = "",value="Test will begin after cilick on Start The Test Button"),
                                textInput(inputId = "aftermessage", label = "Message After Test",placeholder = "","Test is over. Thank you for participating."),
                                actionBttn(inputId ="saveconfig",label = "Save Settings",size="sm",color="primary",block = TRUE,style="pill" )
                                                                                   
                                                  )))),
                                column(width = 2)
                                    ),
                                   
                                    hidden( div(id="authboxout", 
                                                column(width = 12,
                                                       column(width = 4),
                                                       column(width = 4,box(title = "Sign in", status="warning",solidHeader = TRUE,
                                                                            textInput(inputId = "signuser", label = "User Name",width = '100%'),
                                                                            textInput(inputId = "signpassword", label = "Password",width = '100%'),width = 12),
                                                              actionBttn(inputId ="submitauth",label = "Get Reports",size="md",color="primary",block = TRUE,style="pill")),
                                                       column(width = 4)
                                                       
                                                ))),
                                    
      
                                    hidden(div(id="resboxout",
                                               valueBoxOutput("participantBox",width=2),
                                               valueBoxOutput("meanabilityBox",width=2),
                                               valueBoxOutput("meanseBox",width=2),
                                               valueBoxOutput("meanlengthBox",width=2),
                                               valueBoxOutput("userateBox",width=2),
                                               valueBoxOutput("correct_rateBox",width=2),
                                               #valueBoxOutput("leastusedBox",width=2),
                                               column(width = 12,
                                                      
                                                      column(width = 4,
                                                             plotOutput("hist")),
                                                      
                                                      column(width=4,
                                                             plotOutput("abilityhist")),
                                                      
                                                      column(width=4,
                                                             plotOutput("seplot"))
                                               ))),
                                    
                                    hidden(div(id="personresboxout",
                                               box(title="Results by Participants",  
                                                   downloadBttn(
                                                                 outputId = "download_results",
                                                                 label = 'Download Results',
                                                                 size = "sm",
                                                                 color = 'default' ,
                                                                 block = TRUE,
                                                                 icon='',
                                                                 style = "pill"
                                               ), dataTableOutput("personres"),status="success",solidHeader=TRUE,width=12)
                                    )),
                                   
              
                    column(width = 12,
                           
                           column(width = 2),
                              column(width = 8,
                                     tags$hr(style = "margin-top: 25px; margin-bottom: 5x;"),
                                  hidden(div(id="aboutboxout",
                                               userBox(
                                                 title = userDescription(
                                                   title = "Hüseyin YILDIZ",
                                                   subtitle = "Psychometrician at Australian Council for Educational Research",
                                                   type = 2,
                                                   image = "hus.jpg",
                                                   backgroundImage = "back.png"
                                                 ),
                                                 status = "primary",
                                                 closable = F,
                                                 boxToolSize = "md",
                                               
                                                 maximizable = T,
                                               
                                                h4("e-mail: huseyin.yildiz@acer.org")
                                               
                                               ),
                                               userBox(
                                                 title = userDescription(
                                                   title = "Eda AKDOĞDU YILDIZ ",
                                                   subtitle = "PhD. Educational Measurement",
                                                   type = 2,
                                                   image = "eda.jpg",
                                                   backgroundImage = "back.png",
                                                 ),
                                                 status = "primary",
                                                 closable = F,
                                                 maximizable = T,
                                             
                                                 h4("e-mail: akdogdueda@gmail.com")
                                               
                                                 ))))))))

server <- function(input, output,session) { 

  id<- reactive({
    
    input$login_user
  })
  
  pass<- reactive({
    
    input$login_pass
  })
  
  report <- reactive({

    con <- dbConnect( RMySQL::MySQL(),
                      dbname='sql12674552',
                      host='sql12.freesqldatabase.com',
                      port=3306,
                      user="sql12674552",
                      password='r1GkZvSmaC')
    
    
    
    query <- paste("SELECT * FROM ",id(),"_result",sep = "")  # 'a' tablosunu çekme
    result <- dbGetQuery(con, query)
    
    dbDisconnect(con)
    result
    
    
    
  })
  
  template <-reactive({
    
    bos_dataframe <- data.frame(
      item_id = numeric(),
      STEM = numeric(),
      A = numeric(),
      B = numeric(),
      C = numeric(),
      D = numeric(),
      E = numeric(),
      key = character(),
      apar = numeric(),
      bpar = numeric(),
      stringsAsFactors = FALSE
    )
    
    bos_dataframe
    
  })
  
  observeEvent(input$item_bank,{
    
    
    inFile <- input$item_bank
    if (is.null(inFile))
      return("Please upload data")
    dataset<- read_xlsx(inFile$datapath, sheet=1)
    banka<-as.data.frame(dataset)
   
    con <- dbConnect( RMySQL::MySQL(),
                      dbname='sql12674552',
                      host='sql12.freesqldatabase.com',
                      port=3306,
                      user="sql12674552",
                      password='r1GkZvSmaC')
     
     # tablo_ismi <- 'table'
    
     if (dbExistsTable(con, paste(id(),'_bank',sep=""))) {
      
        # Eğer tablo varsa, üzerine yaz
       
       dbRemoveTable(con,  paste(id(),'_bank',sep=""))  # Mevcut tabloyu sil
       dbWriteTable(con, name =  paste(id(),'_bank',sep=""), value = banka, row.names = FALSE,encoding = "UTF-8")
       
     } else {
       # Eğer tablo yoksa, yeni tablo oluştur
       dbWriteTable(con, name =  paste(id(),'_bank',sep=""), value = banka, row.names = FALSE,encoding = "UTF-8")
       
     }

     dbDisconnect(con)
     
     hide(id = c("template_tutorial_boxout"), anim = FALSE,animType = "slide",time = 1)
     
     # shinyjs::show(id = c("itembankinfo2"), anim = FALSE,animType = "slide",time = 1)
     
     hide(id = c("add_item_boxout2"), anim = FALSE,animType = "slide",time = 1)
     
     hide(id = c("bankaa"), anim = FALSE,animType = "slide",time = 1)
     
     hide(id = c("add_item_boxout"), anim = FALSE,animType = "slide",time = 1)
     
     hide(id = c("backaccountboxout"), anim = FALSE,animType = "slide",time = 1)
     
     shinyjs::show(id = c("homepageboxout"), anim = FALSE,animType = "slide",time = 1) 
     
     shinyjs::show(id = c("login_boxout"), anim = FALSE,animType = "slide",time = 1)
     
     shinyalert("Item Bank Save Completed", "You can update the item bank whenever you wanted.", type = "success", timer = 10000)

  })
  
  observeEvent(input$resultbutton,{
    
    
    hide(id = c("login_boxout"), anim = FALSE)
    
    hide(id = c("homepageboxout"), anim = FALSE)
    
    # hide(id = c("mainboxout"), anim = FALSE,animType = "slide",time = 1)
    
    
    shinyjs::show(id = c("resboxout"), anim = FALSE,animType = "slide",time = 1)
    
    shinyjs::show(id = c("backaccountboxout"), anim = FALSE,animType = "slide",time = 1)
    
    #  print(input$txtbx)
  })
  
  observeEvent(input$result2button,{
    
    
    hide(id = c("login_boxout"), anim = FALSE)
   
    hide(id = c("homepageboxout"), anim = FALSE)
    
    
    
    shinyjs::show(id = c("personresboxout"), anim = FALSE,animType = "slide",time = 1)
    
    shinyjs::show(id = c("backaccountboxout"), anim = FALSE,animType = "slide",time = 1)
    
    #  print(input$txtbx)
  })

  observeEvent(input$login_button,{
    
  
    
    hide(id = c("mainboxout"), anim = FALSE,animType = "slide",time = 1)
    hide(id = c("stepboxout"), anim = FALSE,animType = "slide",time = 1)
    hide(id = c("aboutusboxout"), anim = FALSE,animType = "slide",time = 1)
    
    
    
    shinyjs::show(id = c("authboxout"), anim = FALSE,animType = "slide",time = 1)
    
  })
  
  observeEvent(input$submit_login,{
    
    
    con <- dbConnect( RMySQL::MySQL(),
                      dbname='sql12674552',
                      host='sql12.freesqldatabase.com',
                      port=3306,
                      user="sql12674552",
                      password='r1GkZvSmaC')
    

    
    query <-  paste("SELECT * FROM users WHERE testid = '", id(), "'", sep = "")
    result <- dbGetQuery(con, query)
    
    # query2 <- paste0("SELECT * FROM users WHERE password = '", id(),  "'")
    # result2 <- dbGetQuery(con, query2)
    
    dbDisconnect(con)
    
    
    if (nrow(result) > 0 ) {
      
      hide(id = c("authboxout"), anim = FALSE,animType = "slide",time = 1)
      
      shinyjs::show(id = c("login_boxout"), anim = FALSE,animType = "slide",time = 1)
      
      shinyjs::show(id = c("homepageboxout"), anim = FALSE,animType = "slide",time = 1)
      
      
      
    } 
    
    if(nrow(result) < 1 ) {
      
      shinyalert("Invalid Test ID or Password!", "Please check your Test ID and Password!", type = "error")
      
    }
    
 
  })
  
  observeEvent(input$create_bank_button,{
    
    
    hide(id = c("login_boxout"), anim = FALSE)
    
    hide(id = c("homepageboxout"), anim = FALSE)
   
    shinyjs::show(id = c("backaccountboxout"), anim = FALSE,animType = "slide",time = 1)
    
    shinyjs::show(id = c("template_tutorial_boxout"), anim = FALSE,animType = "slide",time = 1)

    # shinyjs::show(id = c("itembankinfo2"), anim = FALSE,animType = "slide",time = 1)

    shinyjs::show(id = c("add_item_boxout2"), anim = FALSE,animType = "slide",time = 1)

    shinyjs::show(id = c("bankaa"), anim = FALSE,animType = "slide",time = 1)

    shinyjs::show(id = c("add_item_boxout"), anim = FALSE,animType = "slide",time = 1)
  
  })

  observeEvent(input$login_button,{
    
    hide(id = c("mainboxout"), anim = FALSE,animType = "slide",time = 1)
    
    shinyjs::show(id = c("create_edit_boxout"), anim = FALSE,animType = "slide",time = 1)
    
    shinyjs::show(id = c("itembankinfo"), anim = FALSE,animType = "slide",time = 1)
    
    shinyjs::show(id = c("homepageboxout"), anim = FALSE,animType = "slide",time = 1)
    
    
   
  })
  
  observeEvent(input$setting,{
    
    
    hide(id = c("login_boxout"), anim = FALSE)
    
    hide(id = c("homepageboxout"), anim = FALSE)
    
    
    shinyjs::show(id = c("configboxout"), anim = FALSE,animType = "slide",time = 1)
    
    shinyjs::show(id = c("backaccountboxout"), anim = FALSE,animType = "slide",time = 1)

  })
  
  observeEvent(input$homepage,{
     
     hide(id = c("login_boxout"), anim = FALSE)
     
     hide(id = c("backaccountboxout"), anim = FALSE)
     
     hide(id = c("surveyboxout"), anim = FALSE)
     
     hide(id = c("homepageboxout"), anim = FALSE)
     
     hide(id = c("authboxout"), anim = FALSE)
     
     hide(id = c("aboutboxout"), anim = FALSE)
     
     
     shinyjs::show(id = c("stepboxout"), anim = FALSE,animType = "slide",time = 1)
     shinyjs::show(id = c("mainboxout"), anim = FALSE,animType = "slide",time = 1)
     shinyjs::show(id = c("aboutusboxout"), anim = FALSE,animType = "slide",time = 1)
     
     
   })
  
  observeEvent(input$backtoaccount,{
    
    
    hide(id = c("backaccountboxout"), anim = FALSE,animType = "slide",time = 1)
    hide(id = c("configboxout"), anim = FALSE,animType = "slide",time = 1)
    hide(id = c("resboxout"), anim = FALSE,animType = "slide",time = 1)
    hide(id = c("personresboxout"), anim = FALSE,animType = "slide",time = 1)
    hide(id = c("backaccountboxout"), anim = FALSE,animType = "slide",time = 1)
    hide(id = c("template_tutorial_boxout"), anim = FALSE,animType = "slide",time = 1)
    hide(id = c("add_item_boxout2"), anim = FALSE,animType = "slide",time = 1)
    hide(id = c("bankaa"), anim = FALSE,animType = "slide",time = 1)
    hide(id = c("add_item_boxout"), anim = FALSE,animType = "slide",time = 1)
    
    shinyjs::show(id = c("login_boxout"), anim = FALSE,animType = "slide",time = 1)    
    shinyjs::show(id = c("homepageboxout"), anim = FALSE,animType = "slide",time = 1)   
    
    
    
  })
  
  observeEvent(input$template_popup,{
    
    shinyalert(closeOnClickOutside=T, closeOnEsc=T,size='m',imageUrl = "template_popup.png",imageHeight = 720,imageWidth = 720)
  })
  
  observeEvent(input$home,{
    
    
    hide(id = c("bankboxout"), anim = FALSE,animType = "slide",time = 1)
    hide(id = c("startboxout"), anim = FALSE,animType = "slide",time = 1)
    hide(id = c("authboxout"), anim = FALSE,animType = "slide",time = 1)
    hide(id = c("reportboxout"), anim = FALSE,animType = "slide",time = 1)
    hide(id = c("surveyboxout"), anim = FALSE,animType = "slide",time = 1)
    hide(id = c("infoboxout"), anim = FALSE,animType = "slide",time = 1)
    hide(id = c("aboutboxout"), anim = FALSE,animType = "slide",time = 1)
    hide(id = c("resboxout"), anim = FALSE,animType = "slide",time = 1)
    hide(id = c("itemsboxOut"), anim = FALSE,animType = "slide",time = 1)
    hide(id = c("optionsboxout"), anim = FALSE,animType = "slide",time = 1)
    hide(id = c("itemsboxOut"), anim = FALSE,animType = "slide",time = 1)
    
    shinyjs::show(id = c("stepboxout"), anim = FALSE,animType = "slide",time = 1)
    shinyjs::show(id = c("mainboxout"), anim = FALSE,animType = "slide",time = 1)
    shinyjs::show(id = c("aboutusboxout"), anim = FALSE,animType = "slide",time = 1)
    

  })
  
  observeEvent(input$saveadmin, {

    regex <- "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
    
    con <- dbConnect( RMySQL::MySQL(),
                      dbname='sql12674552',
                      host='sql12.freesqldatabase.com',
                      port=3306,
                      user="sql12674552",
                      password='r1GkZvSmaC')
    
    query <-  paste("SELECT * FROM users WHERE testid = '", input$testid, "'", sep = "")
    aa <- dbGetQuery(con, query)
    dbDisconnect(con)
    
    if(nrow(aa) > 0 ){
      
      shinyalert("Test ID is not available", "Please insert a unique Test ID", type = "error")
      
     
    }
    
    if(nrow(aa)<1){
    
    if(input$password==input$password_confirm & grepl(regex, input$email) ){
    
    con <- dbConnect( RMySQL::MySQL(),
                      dbname='sql12674552',
                      host='sql12.freesqldatabase.com',
                      port=3306,
                      user="sql12674552",
                      password='r1GkZvSmaC')
    
    query <-  paste("SELECT * FROM users WHERE testid = '", input$testid, "'", sep = "")
    aa <- dbGetQuery(con, query)
    
    # query2 <- paste0("SELECT * FROM users WHERE password = '", id(),  "'")
    # result2 <- dbGetQuery(con, query2)
    

    query <- paste("INSERT INTO users (testid, password, eposta, full_name, institution, info ) VALUES ('",input$testid,"',' ",input$password,"',' ",input$email,"
                                                             ','",input$full_name,"','",input$institution,"','",input$aim,"')",sep='')
    
    
    
  
    query2<-  paste(" CREATE TABLE ",input$testid,"_config (
    
      start VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      selection VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      terminate VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      estimation VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      final_estimation VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      beforemessage VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      aftermessage VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      start1 VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      start2 VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      terminate1 VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      terminate2 VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
    )",sep="")
    
    query3<-  paste(" CREATE TABLE ",input$testid,"_bank (
      item_id VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      STEM VARCHAR(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      dista VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      distb VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      distc VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      distd VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      diste VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      correct_key VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      apar VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      bpar VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      cpar VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
      dpar VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
    )",sep="" )
    
    
    query4 <- paste("CREATE TABLE ", paste(input$testid, '_result', sep = ""), " (theta VARCHAR(255), sem VARCHAR(255), item_number VARCHAR(255), item_list VARCHAR(255), theta_list VARCHAR(255), sem_list VARCHAR(255), number_correct VARCHAR(255), number_incorrect VARCHAR(255))", sep = "")
    
    # 
 #  query3 <- paste("CREATE TABLE ",paste(input$testid,'_bank',sep="")  , "(context VARCHAR(255), dista VARCHAR(255), distb VARCHAR(255), distc VARCHAR(255), distd VARCHAR(255), diste VARCHAR(255),apar VARCHAR(255),bpar VARCHAR(255)" ,sep="")
    # 
    
    result<- dbSendQuery(con,query)
    
    result2<- dbSendQuery(con,query2)
    
    result3<- dbSendQuery(con,query3)
    
    result4<- dbSendQuery(con,query4)
    
    dbDisconnect(con)
    
  #  shinyalert("Account Created Successfully","You are being redirected to the main page. You can log in to your account.", type = "info",time=7000)
    
    
    hide(id = c("surveyboxout"), anim = FALSE,animType = "slide",time = 1)
    
    shinyjs::show(id = c("stepboxout"), anim = FALSE,animType = "slide",time = 1)
    shinyjs::show(id = c("mainboxout"), anim = FALSE,animType = "slide",time = 1)
    
    shinyalert("Adaptive Test Created", " You can login with your Test ID and Password now.", type = "success", timer = 7000)
    
    }
    
    if(!grepl(regex, input$email)){
      
      shinyalert("Invalid Email Address", "Please insert a valid email address", type = "error")
      
    }
    
    if(input$password!=input$password_confirm){
      
      shinyalert("Password Confirmation Error!", "Password inputs did not match. Please try again.", type = "error")
      
    }}
  })
  
  observeEvent(input$saveconfig,{
   
     con <- dbConnect( RMySQL::MySQL(),
                      dbname='sql12674552',
                      host='sql12.freesqldatabase.com',
                      port=3306,
                      user="sql12674552",
                      password='r1GkZvSmaC')
    
    query <- paste("INSERT INTO ",id(),"_config"," ( start, selection, terminate,estimation,final_estimation,beforemessage,aftermessage, start1, start2,  terminate1,terminate2 ) VALUES ('",input$starttest,"','",input$itemselect,"','",input$terminate,"','",input$estimationrule,"','",input$finalestimation,"','",input$beforemessage,"','",input$aftermessage,"','",input$start1,"','",paste(input$start2,collapse='_'),"','",input$terminate1,"','",input$terminate2,"')",sep='')
    result<- dbSendQuery(con,query)
    
    dbDisconnect(con)
    
    hide(id = c("configboxout"), anim = FALSE,animType = "slide",time = 1)
    
    hide(id = c("backaccountboxout"), anim = FALSE,animType = "slide",time = 1)
    
    shinyjs::show(id = c("homepageboxout"), anim = FALSE,animType = "slide",time = 1)
    
    shinyjs::show(id = c("login_boxout"), anim = FALSE,animType = "slide",time = 1)
    
    shinyalert("Adaptive Test Settings Saved", "You can update whenever you wanted.", type = "success", timer = 5000)
    
    
    # showModal(modalDialog(
    #   title = "Adaptive Test Settings Saved",
    #   "Your settings has been saved. Please click the 'Close' button to return your account page!",
    #   easyClose = TRUE,
    #   footer = actionButton('config_close','Close')
    # ))
    
  })
  
  observeEvent(input$adminbutton,{

    hide(id = c("stepboxout"), anim = FALSE,animType = "slide",time = 1)
    hide(id = c("mainboxout"), anim = FALSE,animType = "slide",time = 1)
    hide(id = c("aboutusboxout"), anim = FALSE,animType = "slide",time = 1)
    

    shinyjs::show(id = c("surveyboxout"), anim = FALSE,animType = "slide",time = 1)
    shinyjs::show(id = c("save_config_boxout"), anim = FALSE,animType = "slide",time = 1)
    shinyjs::show(id = c("homepageboxout"), anim = FALSE,animType = "slide",time = 1)
    

  })
  
  observeEvent(input$contact,{
    
    
    hide(id = c("stepboxout"), anim = FALSE, animType = "slide",time = 0.5)
    hide(id = c("mainboxout"), anim = FALSE, animType = "slide",time = 0.5)
    hide(id = c("aboutusboxout"), anim = FALSE, animType = "slide",time = 0.5)
    
    
    
    shinyjs::show(id = c("aboutboxout"), anim = T,animType = "slide",time = 0.5)
    shinyjs::show(id = c("homepageboxout"), anim = FALSE,animType = "slide",time = 1)
    
    
    
  })
  
  observeEvent(input$getreport,{
    
    hide(id = c("reportboxout"), anim = FALSE,animType = "slide",time = 2)
    
    if(input$reportselect=="Summary Statistics"){
      
      shinyjs::show(id = c("resboxout"), anim = FALSE,animType = "slide",time = 2)
    }
    
    else if(input$reportselect=="Results by Participants"){
      
      shinyjs::show(id = c("personresboxout"), anim = FALSE,animType = "slide",time = 2)
      
    }
    
  })
 
  output$hist<-renderPlot({
    
    data<-as.data.frame(report())
   
    data<- as.vector(data$item_list)
     
    items<- paste(data,collapse = "-")
    
    items<-unlist(strsplit(items, split="-"))
    
    number<-length(unique(items))
    
    items_sorted<-sort(unique(items),decreasing = F)
    
    
    exposure<-c()
    
    Level<-c()
    for(i in 1:number){
      
      exposure[i]<-sum(items== items_sorted[i])/nrow(report())
      
      if(sum(items==i)/nrow(report())<=0.5){
        Level[i]<-"Low Exposure"
      }
      else if(sum(items==i)/nrow(report()) > 0.5){
        Level[i]<-"High Exposure"
      }
    }
    
    dat<-as.data.frame(cbind(items_sorted,exposure,Level))
    
    dat$item<-as.numeric(dat$items_sorted)
    dat$exposure<-as.numeric(dat$exposure)
    
    ggplot(data=dat, mapping=aes(x=item,y=exposure, fill=Level))+
      geom_bar(stat = "identity")+
      geom_function(fun=function(x) 0.5,color="red",size=1,linetype="dashed")+
      ggtitle("Item Exposure Rates")+
      xlab("Item Number")+
      ylab("Item Exposure Rates")
    
    
  })
  
  output$abilityhist<-renderPlot({
    
    data<-as.data.frame(report())
    
    ability<-as.numeric(data$theta)
    dat<-as.data.frame(ability)
    ggplot(dat, aes(ability))+
      geom_histogram(color="blue", fill="green",binwidth = 0.5,orientation = "x")+
      xlim(c(-3,3))+
      ggtitle("Distribution of Estimated Abilities")+
      xlab("Ability Levels")+
      ylab("Frequence")
    
    
  })
  
  output$seplot<-renderPlot({
    
  data<-as.data.frame(report())
    
  semlist<-as.vector(data$sem_list)
  
  liste<-list()
  
  for(j in 1:length(semlist)){
    
    liste[[j]] <- as.vector(unlist(strsplit(semlist[j],split="-")))
    
  }
  
  lengths<-sapply(liste, length)

  tablo<- matrix(NA,nrow= nrow(data), ncol =max(lengths))

  for(i in 1:nrow(data)){

     tablo[i,1:(lengths[i])]<- as.vector(as.numeric(liste[[i]]))

  }
ort_sem<-colMeans(tablo,na.rm = T)

    sayi<-1:ncol(tablo)

    dat<-data.frame(as.numeric(sayi),as.numeric(ort_sem))
 
    ggplot(dat, aes(x = sayi, y = ort_sem)) +
      geom_line(color = "red", size = 1.5, linetype = "dashed") +  # Çizgi rengi ve tipi değiştirildi
      ggtitle("Standart Errors by Items") +
      xlab("Test Length") +
      ylab("Standart Error") +
      xlim(c(1, nrow(dat))) +
      ylim(c(0, 1.2))+
      theme(panel.background = element_rect(fill = "lightgray"))  # Arka plan rengi değiştirildi

  })
  
  # output$inputs <- renderUI({
  #   if (input$show_inputs) {
  #     fluidRow(
  #       column(width = 12,
  #              selectInput("select_number", "Choose Number of Contents:", choices = c(2, 3, 4, 5)),
  #             column(width = 4,
  #               uiOutput("text_inputs")),
  #             column(width = 1),
  #             column(width = 4,
  #               uiOutput("probs")  
  #                    
  #                    )
  #             
  #       )
  #     )
  #   }
  # })
  # 
  # output$text_inputs <- renderUI({
  #   num <- as.integer(input$select_number)
  #   text_inputs <- lapply(1:num, function(i) {
  #     textInput(paste0("text_", i), label = paste("Content Name", i, ":"))
  #   })
  #   do.call(tagList, text_inputs)
  # })
  # 
  # output$probs <- renderUI({
  #   num <- as.integer(input$select_number)
  #   probs <- lapply(1:num, function(i) {
  #     textInput(paste0("text_", i), label = paste("Probability", i, ":"))
  #   })
  #   do.call(tagList, probs)
  # })
  # 
  output$participantBox <- renderValueBox({
    
    valueBox(
      nrow(report()), "Participants", icon = icon("user", lib = "glyphicon"),
      color = "blue"
    )
  })
  
  output$meanabilityBox <- renderValueBox({
    
    valueBox(
      round(mean(as.numeric(report()$theta)),3), "Mean Ability", icon = icon("signal", lib = "glyphicon"),
      color = "green"
    )
  })
  
  output$meanseBox <- renderValueBox({
    
    valueBox(
      round(mean(as.numeric(report()$sem)),3), "Mean Standart Error", icon = icon("thumbs-up", lib = "glyphicon"),
      color = "aqua"
    )
  })
  
  output$meanlengthBox <- renderValueBox({
    
    valueBox(
      round(mean(as.numeric(report()$item_number)),2), "Mean Test Length", icon = icon("time", lib = "glyphicon"),
      color = "maroon"
    )
  })
  
  output$correct_rateBox <- renderValueBox({
    
  rate<-NA
  
  for(k in 1:nrow(report())){
    
  rate[k] <-  as.numeric(report()$number_correct[k]) / ( as.numeric(report()$number_correct[k]) +  as.numeric(report()$number_incorrect[k]))
   
  }
  correct_rate <-  round(mean(rate),2)
    
   # correct_rate <-round(mean((report()$number_correct)/(report()$number_correct + report()$number_incorrect)),2)
    
  correct_rate<-correct_rate*100
    
    
    
    valueBox(
      paste("%",correct_rate), "Correct Ratio", icon = icon("star", lib = "glyphicon"),
      color = "maroon"
    )
  })
  
  output$userateBox <- renderValueBox({
    
    data<-as.data.frame(report())
    
    
    a<-paste(report()$item_list,collapse = "-")
    items<- strsplit(a,split = "-")
    # items<-as.numeric(items[[1]])
    sayi<-(length(unique(items))/20)*100
    
    valueBox(
      paste("%",sayi), "Used Item Percentage", icon = icon("thumbs-up", lib = "glyphicon"),
      color = "yellow"
    )
  })
  
  output$personres <- renderDataTable({
    
    data<-as.data.frame(report()[,1:8])
    
    data<-
    
    data
  })
  
  observeEvent(input$config_close ,{
    
    removeModal()
    
   hide(id = c("configboxout"), anim = FALSE,animType = "slide",time = 1)
    
   shinyjs::show(id = c("login_boxout"), anim = FALSE)
    
  })

  output$download_template <- downloadHandler(
    filename = function() {
      paste("item_bank_template", ".xlsx", sep="")
    },
    content = function(file) {
      write_xlsx(template(), file)
    }
  )
  
  
  output$download_results <- downloadHandler(
    filename = function() {
      paste("individual_cat_results", ".xlsx", sep="")
    },
    content = function(file) {
      write_xlsx(report(), file)
    }
  )

}

shinyApp(ui, server)