---
lab:
    title: 'Explore the Speech Studio'
---

# Explore the Speech Studio

> **Note**
> To complete this lab, you will need an [Azure subscription](https://azure.microsoft.com/free?azure-portal=true) in which you have administrative access.

The **Azure AI Speech** service transcribes speech into text, and text into audible speech. You might use AI Speech to create an application that can transcribe meeting notes or generate text from the recording of interviews.

In this exercise, you will try out the capabilities of Azure AI Speech using Azure AI Speech Studio. 

## Create an *Azure AI services* resource

You can use the Speech service by creating either a **Speech** resource or an **Azure AI services** resource.

If you haven't already done so, create an **Azure AI services** resource in your Azure subscription.

1. In another browser tab, open the Azure portal at [https://portal.azure.com](https://portal.azure.com?azure-portal=true), signing in with your Microsoft account.

1. Click the **&#65291;Create a resource** button and search for *Azure AI services*. Select **create** an **Azure AI services** plan. You will be taken to a page to create an Azure AI services resource. Configure it with the following settings:
    - **Subscription**: *Your Azure subscription*.
    - **Resource group**: *Select or create a resource group with a unique name*.
    - **Region**: *Choose any available region*.
    - **Name**: *Enter a unique name*.
    - **Pricing tier**: Standard S0
    - **By checking this box I acknowledge that I have read and understood all the terms below**: Selected.

1. Review and create the resource.

## Explore speech to text in Speech Studio
1.	Select https://github.com/MicrosoftLearning/AI-900-AIFundamentals/raw/main/data/speech/speech.zip) and save the file to a folder on your computer. Unzip the files and make a note of the folder name.
2.	On the Get started with Speech page, under Speech find Real-time speech to text. Select Try out Real-time speech to text. 
3.	Under Choose audio files, select Browse files and navigate to the folder where you saved the file. Select Recording.m4a and then Open.
4.	The Speech service transcribes and displays the text in real time. If you have audio on your computer, you can listen to the recording as the text is being transcribed.
5.	Review the output, which should have successfully recognized and transcribed the audio into text.
In this exercise you created an AI Speech resource in Speech Studio. You then used the Real-time speech to text service to transcribe an audio recording. You were able to see the text transcription being generated as the audio file was played.

## Clean up
If you don’t intend to do more exercises, delete any resources that you no longer need. This avoids accruing any unnecessary costs.
1.	Open the Azure portal and select the resource group that contains the AI Speech resource that you created. 
2.	Select the Speech service resource and select Delete and then Yes to confirm. The resource is then deleted. 


## Learn more

This simple app shows only some of the capabilities of the Speech service. To learn more about what you can do with this service, see the [Speech page](https://azure.microsoft.com/services/cognitive-services/speech-services/).
