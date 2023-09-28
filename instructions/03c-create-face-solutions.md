---
lab:
    title: 'Explore face detection​'
---

# Explore face detection

> **Note**
> To complete this lab, you will need an [Azure subscription](https://azure.microsoft.com/free?azure-portal=true) in which you have administrative access.

To test the face detection capabilities of the Azure AI Face service, you will use Azure Vision Studio. This is a UI-based platform that lets you explore Azure AI Vision features without needing to write any code.

You can use the Face service by creating an **AI services** resource. If you haven't already done so, create an **AI services** resource in your Azure subscription.

## Create an *AI services* resource

1. In another browser tab, open the Azure portal at [https://portal.azure.com](https://portal.azure.com?azure-portal=true), signing in with your Microsoft account.

1. Click the **&#65291;Create a resource** button, search for *AI services*, and create an **AI services** resource with the following settings:
    - **Subscription**: *Your Azure subscription*.
    - **Resource group**: *Select or create a resource group with a unique name*.
    - **Region**: *Choose any available region*.
    - **Name**: *Enter a unique name*.
    - **Pricing tier**: Free F0

1. Review and create the resource, and wait for deployment to complete. Then go to the deployed resource.

## Copy files from GitHub

To test the capabilities of the Face detect service, download some photographs from GitHub. 

1. In another browser tab, [Open GitHub](https://github.com/MicrosoftLearning/AI-900-AIFundamentals).

1. Navigate to the data/vision folder, and select faces.zip. 

1. Click the download symbol to download the zip file to your Downloads folder. 

    ![Click to downoad](media/download.png)       


## Explore Detect Faces in Vision Studio

You are now ready to try out the capabilities of the Face service.

1. In another browers tab, open [Vision Studio](https://portal.vision.cognitive.azure.com/), signing in with your Microsoft account. 

1. Click **Settings** and then click **Refresh**.

1.  Select the AI services resource that you created earlier, then click **Select as default resource**. Save and close Settings. 
1.	Return to the Get Started with Vision page, and click **Face** to display the Detect Faces in an image panel. Click **Try it out** and acknowledge the message about resource usage. 
1.	Click **Browse for a file** and navigate to your Downloads folder. Select *store-camera-1.jpg* and click **Open**. The Detected Attributes panel displays the results. 

1. Now let's try some more images. From your Downloads folder, select each of the following images in turn:

   - store-camera-2.jpg
   - store-camera-3.jpg
   - store-camera-4.jpg

1. Review the results for each image.

## Learn more

This simple exercise demonstrates only some of the capabilities of the Face service. To learn more about what you can do, see the [Face API page](https://azure.microsoft.com/products/cognitive-services/vision-services).
