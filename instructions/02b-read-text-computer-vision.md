---
lab:
    title: 'Read text in Vision Studio​'
---

# Read text in Vision Studio

In this exercise you’ll use Azure AI service to explore the optical character recognition capabilities of Azure AI Vision. You’ll use Vision Studio to experiment with extracting text from images, without having to write any code.
> **Note**
> To complete exercise lab, you will need an [Azure subscription](https://azure.microsoft.com/free?azure-portal=true) in which you have administrative access.

A common computer vision challenge is to detect and interpret text embedded within an image. This is known as optical character recognition (OCR). In this exercise you’ll use an AI services resource, which includes AI Vision services. You’ll then use Vision Studio to try out the OCR service with different types of images.

## Create an *Azure AI services* resource

You can use the Azure AI Vision service by creating either a **Computer Vision** resource or an **Azure AI services** resource.
If you haven't already done so, create an **Azure AI services** resource in your Azure subscription.

1. In another browser tab, open the Azure portal at [https://portal.azure.com](https://portal.azure.com?azure-portal=true), signing in with your Microsoft account.

1. Click the **&#65291;Create a resource** button and search for *Azure AI services*. Select **create** an **Azure AI services** resource. You will be taken to a page to create an Azure AI services resource. Configure it with the following settings:
    - **Subscription**: *Your Azure subscription*.
    - **Resource group**: *Select or create a resource group with a unique name*.
    - **Region**: *Choose any available region*.
    - **Name**: *Enter a unique name*.
    - **Pricing tier**: *Standard S0.*
    - **By checking this box I acknowledge that I have read and understood all the terms below**: *Selected*.

1. Review and create the resource, and wait for deployment to complete. Then go to the deployed resource.

## Extract text from images in the Vision Studio

1. In another browser tab, open [**Vision Studio**](https://portal.vision.cognitive.azure.com?azure-portal=true), signing in with your Microsoft account.
1. Select **Settings** and then, on the Select a resource to work with page, select the resource you just created.

    ![Settings](media/read-text-computer-vision/settings-toggle.png)

    > **Note**
    > If your resource is not showing you may need to **Refresh** the page.
    
1. Select the AI services resource that you created earlier, then select **Select as default resource**. **Save** and close Settings.
1. Download the `ocr-images` folder https://aka.ms/ocr-images. Unzip the files.
1. On the *Get started with Vision* page select **Optical character recognition**.
1. Under *Extract text from images*, select **Try it out**.
1. On the Extract text from images page, under Try it out, check the box next to I acknowledge that this demo will incur usage to my Azure account. 
1. Select **Browse for a file** and navigate to the folder on your computer where you saved the files from GitHub. Select **advert.jpg** and select **Open**.
1. Now review what is returned:
    - In Detected attributes, any text found in the image is organized into a hierarchical structure of regions, lines, and words.
    - On the image, the location of text is indicated by the top-left coordinates, and the width and height of a bounding box, as shown here:

    ![An image of the text in the image outlined](media/read-text-computer-vision/lab-05-bounding-boxes.png)
1. You can now try another image. Select **Browse for a file** and navigate to the folder where you saved the files from GitHub. Select **letter.jpg**.

    ![An image of a typed letter.](media/read-text-computer-vision/letter.jpg)
1. Review the results of the second image. It should return the text and bounding boxes of the text. If you have time, try **note.jpg** and **receipt.jpg**.

## Clean up

If you don’t intend to do more exercises, delete any resources that you no longer need. This avoids accruing any unnecessary costs.

1. Open the [Azure portal]( https://portal.azure.com) and select the resource group that contains the resource you created.
1. Select the resource and select **Delete** and then **Yes** to confirm. The resource is then deleted.

## Learn more

To learn more about what you can do with this service, see the [Azure AI Vision](https://docs.microsoft.com/azure/cognitive-services/computer-vision/overview-ocr) page.
