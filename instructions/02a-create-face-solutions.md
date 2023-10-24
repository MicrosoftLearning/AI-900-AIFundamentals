---
lab:
    title: 'Detect faces in Vision Studio​'
---

# Detect faces in Vision Studio

> **Note**
> To complete this exercise, you will need an [Azure subscription](https://azure.microsoft.com/free?azure-portal=true) in which you have administrative access.

Vision solutions often require an artificial intelligence (AI) solution to be able to detect human faces. For example, suppose the retail company Northwind Traders wants to locate where customers are standing in a store to best assist them. One way to accomplish this is to determine if there are any faces in the images, and if so, to return the bounding box coordinates that show their location. 

To test the face detection capabilities of the Azure AI Face service, you will use [Azure Vision Studio](https://portal.vision.cognitive.azure.com/). This is a UI-based platform that lets you explore Azure AI Vision features without needing to write any code.

To use the Face detect capabilities you will create an Azure AI services multi-service resource. 

## Create an *Azure AI services* resource
You can use the Azure AI Face service by creating either a **Face** resource or an **Azure AI services** resource. If you haven't already done so, create an **Azure AI services** resource in your Azure subscription.

1. In another browser tab, open the Azure portal at [https://portal.azure.com](https://portal.azure.com?azure-portal=true), signing in with your Microsoft account.

1. Select **&#65291;Create a resource** and search for AI services. Then create an AI services resource with the following settings:
    - Subscription: *Your Azure subscription*.
    - Resource group: *Select or create a resource group*. 
    - Region: *Choose any available region*.
    - Name: *Enter a unique name.*
    - Pricing tier: *FO (if available, otherwise select SO.)*
    - Responsible AI Notice: *Select to confirm*.

1. Select **Review + create** then **Create** and wait for deployment to complete. 

## Detect faces in the Vision Studio

1. In another browser tab, open [**Vision Studio**](https://portal.vision.cognitive.azure.com?azure-portal=true), signing in with your Microsoft account.

1. Select **Settings** and then, on the Select a resource to work with page, select the resource you just created.  

> **Note** : if your resource is not showing you may need to **Refresh** the page. 

1. Select the AI services resource that you created earlier, then select **Select as default resource**. Save and close Settings. 

1. Download the folder `detect-faces` https://aka.ms/detect-faces. Unzip the files and make a note of the folder name.

1. Select **Vision Studio** to return to the Get Started with Vision page, and then select **Face** to display the Detect Faces in an image panel. Select **Try it out**.

1. Select to acknowledge the message about resource usage. 

1. Select **Browse for a file**, navigate to the folder where you saved the files, select **store-camera-1.jpg** and select **Open**. The Detected Attributes panel displays the results. 

1. Select **Browse for a file** again and repeat the process for each of the following files:
    - store-camera-2.jpg
    - store-camera-3.jpg 
    - store-camera-4.jpg 

1. Review the results of each image, noticing which images contain faces that can be detected, and when a face cannot be detected. 

In this exercise you have explored how Azure AI services can detect faces in images. You have seen that AI services can detect faces despite being blurred or partially obscured. If you have time, feel free to try the sample images or some of your own images.

## Clean up

If you don’t intend to do more exercises, delete any resources that you no longer need. This avoids accruing any unnecessary costs.
1. Open the [Azure portal](https://portal.azure.com) and select the resource group that contains the AI services resource you created. 
1. Select the *AI services resource*, select **Delete**, and then **Yes** to confirm. The resource is then deleted. 

## Learn more

To learn more about what you can do with this service, see the [Azure AI Vision service page](https://azure.microsoft.com/products/ai-services/ai-vision/).
