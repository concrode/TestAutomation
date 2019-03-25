*** Settings ***
Library           Selenium2Library

*** Variables ***
${browserType}  Chrome
${mainWebsite}  https://sydney.edu.au/ 
${studyElement}     global-navigation-study
${findCourseElement}    Find a course
${searchBarHint}    keywords
${searchInput}      programming
${searchButton}     div.searchButtonColumn 
${firstSearchResult}    ul.b-component li:first-of-type
${startStudyYear}       b-js-personalisation-form-start-studying-button
${year2019}     //li[contains(text(),'2019')]
${studentComesFrom}     b-js-personalisation-form-citizenship-type-button
${internationalStudent}     //li[contains(text(),'an International student')]
${overseasStudentFeeField}      [data-template="b-js-fees-template"] span
${overseasStudentFee}       $46,500 
${clickApply}       [class*="b-js-analytics-link"]

*** Keywords ***
Open Browser Chrome
     Open Browser    ${mainWebsite}    ${browserType}

Open Search Course Page
    Click Element    id=${studyElement}
    Wait Until Element Is Visible    link=${findCourseElement}
    Click Link   link=${findCourseElement}

Search for Course
    Input Text    name=${searchBarHint}    ${searchInput} 
    Click Element    css:${searchButton}

Click Search Results
    Click Element   css:${firstSearchResult}

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


*** Test Cases ***
demoTest
    Open Browser Chrome
    Open Search Course Page  
    Search for Course
    Click Search Results
    # Click Video
    Select Start Study Year 
    Select Student Comes From
    Check Fees For Overseas Student
    Click Apply Link
    Close BROWSER
