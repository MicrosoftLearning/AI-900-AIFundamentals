---
lab:
    title: 'Explore face recognition​'
---

# Explore face recognition

> **Note**
> To complete this lab, you will need an [Azure subscription](https://azure.microsoft.com/free?azure-portal=true) in which you have administrative access.

Vision solutions often require an artificial intelligence (AI) solution to be able to detect human faces. For example, suppose the retail company Northwind Traders wants to locate where customers are standing in a store to best assist them. One way to accomplish this is to determine if there are any faces in the images, and if so, to return the bounding box coordinates that show their location. 

To test the face detection capabilities of the Azure AI Face service, you will use Azure Vision Studio. This is a UI-based platform that lets you explore Azure AI Vision features without needing to write any code.

To use the Face detect capabilities you will create an Azure AI services multi-service resource. If you haven’t yet already done so, create an AI services resource in your Azure subscription.

## Create an *Azure AI services* resource

1. In another browser tab, open the Azure portal at [https://portal.azure.com](https://portal.azure.com?azure-portal=true), signing in with your Microsoft account.

1. Click the **&#65291;Create a resource** button and search for AI services. Then create an AI services resource with the following settings:
    - Subscription: Your Azure subscription.
    - Resource group: Select or create a resource group. 
    - Region: Choose any available region.
    - Name: Enter a unique name.
    - Pricing tier: FO (if available, otherwise select SO.) 
    - Responsible AI Notice: Select to confirm.

1. Select Review + create and then Create. Then wait for deployment to complete. 

•	In another browser tab, open Vision Studio, signing in with your Microsoft account.
•	Select Settings and then, on the Select a resource to work with page, select the resource you just created.  
 
!Note : if your resource is not showing you may need to Refresh the page. 
•	Select the AI services resource that you created earlier, then select Select as default resource. Save and close Settings. 
•	Select https://github.com/MicrosoftLearning/AI-900-AIFundamentals/raw/main/data/vision/training-images.zip) and save the file to a folder on your computer. Unzip the files and make a note of the folder name.
•	Select Vision Studio to return to the Get Started with Vision page, and then select Face to display the Detect Faces in an image panel. Select Try it out.
•	Select to acknowledge the message about resource usage. 
•	Select Browse for a file, navigate to the folder where you saved the files, select store-camera-1.jpg and select Open. The Detected Attributes panel displays the results. 
•	Select Browse for a file again and repeat the process for each of the following files:
o	store-camera-2.jpg
o	store-camera-3.jpg 
o	store-camera-4.jpg 

Review the results of each image, noticing which images contain faces that can be detected, and when a face cannot be detected. 
In this exercise you have explored how Azure AI services can detect faces in images. You have seen that AI services can detect faces despite being blurred or partially obscured. If you have time, feel free to try some of the sample images or some of your own images.
Clean up
If you don’t intend to do more exercises, delete any resources that you no longer need. This avoids accruing any unnecessary costs.
1.	Open the Azure portal and select the resource group that contains the AI services resource you created. 
2.	Select the AI services resource and select Delete and then Yes to confirm. The resource is then deleted. 

## Learn more

This simple app shows only some of the capabilities of the Face service. To learn more about what you can do with this service, see the [Face API page](https://azure.microsoft.com/en-us/products/cognitive-services/vision-services).
