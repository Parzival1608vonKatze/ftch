rm -rf os.log
cat /usr/lib/os-release | sed "s/=/ /g" | sed "s/NAME/Operating System /g"| sed "s/ID_LIKE/based on/g"| sed "s/BUILD_ID/os release model/g" | sed "s/HOME_URL/Webpage/g" | sed "s/DOCUMENTATION_URL/Wiki or Documentation/g"| sed "s/SUPPORT_URL/Help/g" | sed "s/BUG_REPORT_URL/bug report/g" >> os.log

#ANSI_COLOR
#HOME_URL
#DOCUMENTATION_URL
#SUPPORT_URL
#BUG_REPORT_URL
#LOGO