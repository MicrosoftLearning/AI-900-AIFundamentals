---
lab:
    title: 'Analyze text with Language Studio'
---

# Analyze text with Language Studio A

In this exercise you will explore the capabilities of Azure AI Language by analyzing some example hotel reviews. You’ll use Language Studio to understand whether the reviews are mostly positive or negative.

> **Note**
> To complete this exercises, you will need an [Azure subscription](https://azure.microsoft.com/free?azure-portal=true) in which you have administrative access.

Natural Language Processing (NLP) is a branch of artificial intelligence (AI) that deals with written and spoken language. You can use NLP to build solutions that extract semantic meaning from text or speech, or that formulate meaningful responses in natural language.

For example, suppose the fictitious travel agent Margie’s Travel encourages customers to submit reviews for hotel stays. You could use the Language service to identify key phrases, determine which reviews are positive and which are negative, or analyze the review text for mentions of known entities such as locations or people.

Azure AI Language Service includes text analysis and NLP capabilities. These include the identification of key phrases in text, and the classification of text based on sentiment.

> **Note**: The Azure AI services resource also includes the AI Language service. You can use either type of resource but in this exercise you will use Azure AI Language.

## Create a *Language* resource

You can use the Language service by creating either a **Language** resource or an **Azure AI services** resource.

1.	In another browser tab, open [Language Studio](https://language.cognitive.azure.com/). 
1.	You are prompted to select an Azure resource. Either select an existing Language resource in your subscription, or select **Create a new Language** resource by entering the following:
    -	**Subscription**: *Your Azure subscription*.
    -	**Resource group**: *Select or create a resource group with a unique name*.
    -	**Region**: *Choose any available region.*
    -	**Name**: *Enter a unique name.*
    -	**Pricing tier**: *FO*
    -	**Managed identity**: *Off*
    -	**I confirm that I have reviewed and acknowledge the terms in the Responsible AI Notice**: *Selected*.
1.	Select **Done** and wait for the Language resource to be created. The Select an Azure resource prompt is displayed again.
1.	In resource name, select the Language resource you have created, and select **Done**.

## Enable the **Language** resource

1.	Select Language Studio **Settings**, then **Resources**.
 
1.	Select the Language resource you created earlier and under Managed identity, select **Not Enabled** then wait until the label changes to *Enabled*.
1.	Select **Language Studio** to return to the *Welcome page*.

## Analyze reviews in Language Studio

1.	Select **Classify text**, and under *Analyze sentiment and mine opinions*, select **Try it out**.
1.	Under *Select text language*, select **English**. 
1.	Under *Select your Azure resource*, select your Language resource.
1.	Under *Enter your own text, upload a file, or use one of our sample texts*, copy and paste the following review:

    >Tired hotel with poor service
    The Royal Hotel, London, United Kingdom
    5/6/2018
    This is an old hotel (has been around since 1950's) and the room furnishings are average - becoming a bit old now and require changing. The internet didn't work and had to come to one of their office rooms to check in for my flight home. The website says it's close to the British Museum, but it's too far to walk.

1.	Check the box to acknowledge that the demo will incur usage and may incur costs, and then select **Run**. 

1.	Review the output. Notice that the document is analyzed for sentiment, as well as each sentence. Select **Sentence 1** to show the sentiment analysis for that sentence. Select **Sentence 1** again to close. Notice that the sentiment displayed has a confidence level.

1.	Scroll up to select **Clear text box**, and copy and paste the following review:
 
    >Good Hotel and staff
    The Royal Hotel, London, UK
    3/2/2018
    Clean rooms, good service, great location near Buckingham Palace and Westminster Abbey, and so on. We thoroughly enjoyed our stay. The courtyard is very peaceful and we went to a restaurant which is part of the same group and is Indian ( West coast so plenty of fish) with a Michelin Star. We had the taster menu which was fabulous. The rooms were very well appointed with a kitchen, lounge, bedroom and enormous bathroom. Thoroughly recommended.

1.	Select **Run**. Review the output and review the sentiment and confidence level.

1.	Select **Clear text** box again, and copy and paste the following review:

    >Very noisy and rooms are tiny
    The Lombard Hotel, San Francisco, USA
    9/5/2018
    Hotel is located on Lombard street which is a very busy SIX lane street directly off the Golden Gate Bridge. Traffic from early morning until late at night especially on weekends. Noise would not be so bad if rooms were better insulated but they are not. Had to put cotton balls in my ears to be able to sleep--was too tired to enjoy the city the next day. Rooms are TINY. I picked the room because it had two queen size beds--but the room barely had space to fit them. With family of four in the room it was tight. With all that said, rooms are clean and they've made an effort to update them. The hotel is in Marina district with lots of good places to eat, within walking distance to Presidio. May be good hotel for young stay-up-late adults on a budget

1. Select **Run** and review the sentiment together with the confidence level. Have a look at the text and compare the text to the sentiment analysis that the service returned.

In this exercise you used Language Studio to either create a new Language resource or use an existing Language resource. You enabled the resource in Settings before trying out the Sentiment and opinion mining service. You then tested the service with three pieces of text.

## Clean up
If you don’t intend to do more exercises, delete any resources that you no longer need. This avoids accruing any unnecessary costs.
1.	Open the [Azure portal]( https://portal.azure.com) and select the resource group that contains the resource you created. 
1.	Select the resource and select **Delete** and then **Yes** to confirm. The resource is then deleted.

## Learn more

To learn more about what you can do with this service, see the [Language service page](https://azure.microsoft.com/services/cognitive-services/language-service/).

