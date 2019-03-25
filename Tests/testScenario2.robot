*** Settings ***
Library           Selenium2Library

*** Variables ***
${browserType}  Chrome
${mainWebsite}  https://sydney.edu.au/ 
${studyElement}     global-navigation-study
${admissionElement}     left-hand-navigation-admissions
${applyElement}     left-hand-navigation-apply
${howToApplyElement}        left-hand-navigation-how-to-apply
${postgraduateCoursework}       [title="Postgraduate coursework as a domestic or international student"]
${findCourseLink}       Find a course
${firstSearchResult}    ul.b-component li:first-of-type
${searchButton}     div.searchButtonColumn 
${startStudyYear}       b-js-personalisation-form-start-studying-button
${year2019}     //li[contains(text(),'2019')]
${studentComesFrom}     b-js-personalisation-form-citizenship-type-button
${internationalStudent}     //li[contains(text(),'an International student')]
${overseasStudentFeeField}      [data-template="b-js-fees-template"] span
${overseasStudentFee}       $46,500 
${clickApply}       [class*="b-js-analytics-link"]

*** Keywords ***
Open Browser Chrome
     Open Browser    ${mainWebsite}     ${browserType}

Click Study 
    Click Element    id=${studyElement}

Click Admission
    Click Element    id:${admissionElement}

Click Apply
    Click Element    id:${applyElement} 

Click How to Apply
    Click Element   id:${howToApplyElement}

Click Postgraduate Coursework
    Click Element   css:${postgraduateCoursework}

Click Find a Course
    Click Link  link:${findCourseLink} 

Search for Course
    Wait Until Page Contains Element  css:${searchButton}
    Input Text    name=keywords    software
    Click Element    css:${searchButton}

Click Search Results
    Wait Until Page Contains Element    css:${firstSearchResult}
    Click Element  css:${firstSearchResult}

Select Start Study Year 
    Click Element   id=${startStudyYear} 
    Click Element   ${year2019} 

Select Student Comes From
    Click Element   ${studentComesFrom}
    Click Element   ${internationalStudent}

Check Fees For Overseas Student
    Element Should Contain  css=${overseasStudentFeeField}  ${overseasStudentFee}

Click Apply Link
    Click Link  css:${clickApply}  

# Click Entry Year
#     Click Elment    id="entryPeriodInt"

Scroll Down
     #Execute Javascript    $(document).scrollTop(${300})


*** Test Cases ***
demoTest
    Open Browser Chrome
    Click Study 
    Click Admission  
    Click Apply
    Click How to Apply    
    Click Postgraduate Coursework
    Click Find a Course
    Search for Course
    Click Search Results
    Select Start Study Year 
    Select Student Comes From
    Check Fees For Overseas Student
    #Click Apply Course
    Close BROWSER
