import time
start_time = time.time() # time at start of code
import requests
from bs4 import BeautifulSoup
import csv
with open("fandom_pages.csv","r",encoding="utf-8-sig") as urls, open("fandom_data.csv","w", newline="",encoding="utf-8-sig") as fdata:
    csv_output = csv.writer(fdata)
    for url in urls:
        url = url.strip() # find out why urls with %27 don't work # find out why extra rows of issue credit are being written
        try:
            page = requests.get(url) # pull url html
        except:    
            csv_output.writerow([url,"does not exist","does not exist"]) # if url doesn't work
        else:
            soup = BeautifulSoup(page.content, 'html.parser') # parse url html
            isscreds = soup.select_one('aside').find_all('div',recursive=False) # drill down html to where the issue credit data is
            for isscred in isscreds: # write rows of creator credits that are not story specific
                issuecredit = [] # this array will be written to csv
                issuecredit.append(url) # identifiy which url is being written
                issuecredit.append(soup.select('main h1')[0].text.strip()) # issue title, volume, and number
                issuecredit.append('issuecredit') # fills a spare column and identifies row as an issue credit
                issuecredit.append('issuecredit') # fills a spare column and identifies row as an issue credit
                isroles = isscred.select('.pi-data-label') # array of roles under issue credits in html
                iscreators = isscred.select('.pi-data-value') # array of creators under issue credits in html
                counts = list(range(len(isroles))) # array of sequential numbers the length of number of roles
                for count in counts:
                    tors = iscreators[count].select('.hlist a') # array of sequential numbers the length of number of creators in a role
                    if len(tors) == 0: # if there is one creator in a role
                        issuecredit.append(isroles[count].text.strip()) # this is the role credit
                        issuecredit.append(iscreators[count].text.strip()) # this is the creator credit
                    else: # if there is more than one creator in a role
                        for tor in tors:
                            issuecredit.append(isroles[count].text.strip()) # this is the role credit
                            issuecredit.append(tor.text.strip()) # this is the creator credit
                csv_output.writerow(issuecredit) # write issue credit row to csv
            asides = soup.select('aside section') # drill down to where the story data is
            storynum=1 # iterative order number of story in issue
            for aside in asides[:-1]: 
                story = [] # this array will be written to csv
                story.append(url) # identifiy which url is being written
                story.append(soup.select('main h1')[0].text.strip()) # issue title, volume, and number
                if aside.select_one('.pi-item').text.strip() == "Variant Cover Artists": # if a "story label" is not a story title
                    story.append("issuecredit") # fills a spare column and identifies row as an issue credit
                    story.append("issuecredit") # fills a spare column and identifies row as an issue credit
                    storynum -= 1 # reset story number
                else:
                    story.append(storynum) # order number of story in issue
                    story.append(aside.select_one('.pi-item').text.strip()) # Story Title
                roles = aside.select('.pi-data-label') # array of roles under story credits in html
                creators = aside.select('.pi-data-value') # array of creators story issue credits in html
                counts = list(range(len(roles))) # array of sequential numbers the length of number of roles
                for count in counts:
                    tors = creators[count].select('.hlist a') # array of sequential numbers the length of number of creators in a role
                    for tor in tors:
                        story.append(roles[count].text.strip()) # this is the role credit
                        story.append(tor.text.strip()) # this is the creator credit
                storynum += 1 # increment story number
                csv_output.writerow(story) # write story info and credits to csv
        time.sleep(1) # added time to not requests domain too soon # not required but courteous probably
end_time = time.time() # time at end of code
hours = int((end_time-start_time)/60/60) # hours of time the code took to run
minutes = int((end_time-start_time)/60) - hours*60 # minutes of time the code took to run
seconds = round((end_time-start_time) - minutes*60 - hours*60*60,3) # seconds of time the code took to run
print("time to run: ",hours,":",minutes,":",seconds) # print how long the code took to run to terminal
