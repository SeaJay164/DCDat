import time
start_time = time.time()
import requests
from bs4 import BeautifulSoup
import csv
with open("fandom_pages.csv","r",encoding="utf-8-sig") as urls, open("fandom_data.csv","w", newline="",encoding="utf-8-sig") as fdata:
    csv_output = csv.writer(fdata)
    for url in urls:
        url = url.strip()
        try:
            page = requests.get(url)
        except:    
            csv_output.writerow([url,"does not exist","does not exist"])
        else:
            soup = BeautifulSoup(page.content, 'html.parser')
            isscreds = soup.select_one('aside').find_all('div',recursive=False)
            for isscred in isscreds:
                issuecredit = []
                issuecredit.append(url)
                issuecredit.append(soup.select('main h1')[0].text.strip())
                issuecredit.append('issuecredit')
                issuecredit.append('issuecredit')
                isroles = isscred.select('.pi-data-label')
                iscreators = isscred.select('.pi-data-value')
                counts = list(range(len(isroles)))
                for count in counts:
                    tors = iscreators[count].select('.hlist a')
                    if len(tors) == 0:
                        issuecredit.append(isroles[count].text.strip())
                        issuecredit.append(iscreators[count].text.strip())
                    else:
                        for tor in tors:
                            issuecredit.append(isroles[count].text.strip())
                            issuecredit.append(tor.text.strip())
                csv_output.writerow(issuecredit)
            asides = soup.select('aside section')
            storynum=1
            for aside in asides[:-1]:
                story = []
                story.append(url)
                story.append(soup.select('main h1')[0].text.strip())
                story.append(storynum)
                if aside.select_one('.pi-item').text.strip() == "Variant Cover Artists":
                    story.append("issuecredit")
                    storynum -= 1
                else:
                    story.append(aside.select_one('.pi-item').text.strip())
                roles = aside.select('.pi-data-label')
                creators = aside.select('.pi-data-value')
                counts = list(range(len(roles)))
                for count in counts:
                    tors = creators[count].select('.hlist a')
                    for tor in tors:
                        story.append(roles[count].text.strip())
                        story.append(tor.text.strip())
                storynum += 1
                csv_output.writerow(story)
        time.sleep(1)
end_time = time.time()
hours = int((end_time-start_time)/60/60)
minutes = int((end_time-start_time)/60) - hours*60
seconds = round((end_time-start_time) - minutes*60 - hours*60*60,3)
print("time to run: ",hours,":",minutes,":",seconds)