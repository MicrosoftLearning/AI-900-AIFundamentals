---
lab:
    title: 'Analyze images in Vision Studio'
---

# Analyze images in Vision Studio 

**Azure AI Vision** includes numerous capabilities for understanding image content and context and extracting information from images. Azure AI Vision Studio allows you to try out many of the capabilities of image analysis. 

In this exercise, you will use Vision Studio to analyze images using the built-in try-it-out experiences. Suppose the fictitious retailer *Northwind Traders* has decided to implement a "smart store", in which AI services monitor the store to identify customers requiring assistance, and direct employees to help them. By using Azure AI Vision, images taken by cameras throughout the store can be analyzed to provide meaningful descriptions of what they depict. 

> **Note**
> To complete this exercise, you will need an [Azure subscription](https://azure.microsoft.com/free?azure-portal=true) in which you have administrative access.

## Create an *Azure AI services* resource

You can use the Azure AI Face service by creating either a **Computer Vision** resource or an **Azure AI services** resource.

If you haven't already done so, create an **Azure AI services** resource in your Azure subscription.

1. In another browser tab, open the Azure portal at [https://portal.azure.com](https://portal.azure.com?azure-portal=true), signing in with your Microsoft account.

1. Click the **&#65291;Create a resource** button and search for *Azure AI services*. Select **create** an **Azure AI services** plan. You will be taken to a page to create an Azure AI services resource. Configure it with the following settings:
    - **Subscription**: *Your Azure subscription*.
    - **Resource group**: *Select or create a resource group with a unique name*.
    - **Region**: East US
    - **Name**: *Enter a unique name*.
    - **Pricing tier**: *Standard S0.*
    - **By checking this box I acknowledge that I have read and understood all the terms below**: *Selected*.

    Select **Review + Create**, then select **Create**. 

    **Note**: Image Analysis 4.0 features are currently available in a limited number of Azure regions. Specifying `East US` ensures access to the 4.0 features from Vision Studio.

    Once the resource is deployed, select **Go to Resource**.

## Connect your Azure AI service resource to Vision Studio

Next, connect the Azure AI service resource you provisioned above to Vision Studio so it can be used for trying out image analysis.

1. In a web browser, navigate to [Vision Studio](https://portal.vision.cognitive.azure.com?azure-portal=true).

2. Sign in with your account and making sure you are using the same directory as the one where you have created your Azure AI services resource.

3. On the Vision Studio home page, select **View all resources** under the **Getting started with Vision** heading.

    ![The View all resource link is highlighted under Getting started with Vision in Vision Studio.](./media/analyze-images-vision/05-vision-studio-view-all-resources.png)

4. On the **Select a resource to work with** page, hover your mouse cursor over the resource you created above in the list and then check the box to the left of the resource name, then select **Select as default resource**.

    ![The Select a resource to work with dialog is displayed with the cog-ms-learn-vision-SUFFIX Cognitive Services resource highlighted and checked. The Select as default resource button is highlighted.](./media/analyze-images-vision/05-vision-studio-select-default-resource.png)

## Generate captions for an image

Now you are ready to use Vision Studio to analyze images taken by a camera in the *Northwind Traders* store.

Let's look at the image captioning functionality of Azure AI Vision. Image captions are available through the **Caption** and **Dense Captions** features.

1. In a web browser, navigate to [Vision Studio](https://portal.vision.cognitive.azure.com?azure-portal=true).

1. On the **Getting started with Vision** landing page, select the **Image analysis** tab and then select the **Add captions to images** tile.

    ![On the Vision Studio home page, the Image analysis tab is selected and highlighted. The Add captions to images tile is highlighted.](./media/analyze-images-vision/05-vision-studio-image-analysis-add-captions-to-images.png)

1. Under the **Try It Out** subheading, acknowledge the resource usage policy by reading and checking the box.  

1. Download the `image-analysis` folder https://aka.ms/image-analysis. Unzip the folder containing the images and locate the file named `store-camera-1.jpg`.

    ![An image of a parent using a cellphone camera to take a picture of a child in in a store](./media/analyze-images-vision/store-camera-1.jpg)

1. Drag the `store-camera-1.jpg` image into the **Drag and drop files here** box, or browse to the location you downloaded the file and select it.

    ![The box for dragging and dropping files is displayed.](./media/analyze-images-vision/05-vision-studio-try-it-out-drag-and-drop-file.png)

1. Observe the generated caption text, visible in the **Detected attributes** panel to the right of the image.

    The **Caption** functionality provides a single, human-readable English sentence describing the image's content.

1. Next, use the same image to perform **Dense captioning**. Return to the **Vision Studio** home page, and as you did before, select the **Image analysis** tab, then select the **Dense captioning** tile.

    ![The Dense captioning tile is displayed.](./media/analyze-images-vision/05-vision-studio-image-analysis-dense-captioning.png)

    The **Dense Captions** feature differs from the **Caption** capability in that it provides multiple human-readable captions for an image, one describing the image's content and others, each covering the essential objects detected in the picture. Each detected object includes a bounding box, which defines the pixel coordinates within the image associated with the object.

1. Hover over one of the captions in the **Detected** attributes list and observe what happens within the image.

    ![The image and its captions are displayed.](./media/analyze-images-vision/)

    Move your mouse cursor over the other captions in the list, and notice how the bounding box shifts in the image to highlight the portion of the image used to generate the caption.

## Tagging images

The next feature you will try is the **Extract Tags** functionality. Extract tags is based on thousands of recognizable objects, including living beings, scenery, and actions.

1. Return to the home page of Vision Studio, then select the **Extract common tags from images** tile under the **Image analysis** tab.

    ![The Extract common tags from images tile is displayed.](./media/analyze-images-vision/05-vision-studio-image-analysis-extract-common-tags.png)

2. In the **Choose the model you want to try out**, leave **Pretrained Vision model** selected. In the **Choose your language**, select **English** or a language of your preference.

3. Open the folder containing the images you downloaded and unzipped and locate the file named `store-image-2.jpg`.

    ![An image of person with a shopping basket in a supermarket](./media/analyze-images-vision/store-camera-2.jpg)

4. Drag the `store-image-2.jpg` file into the **Drag and drop a file here** box, or select **Browse for a file** and retrieve the `store-image-2.jpg` file from the location you saved it to your local computer.

    ![The box for dragging and dropping files is displayed.](./media/analyze-images-vision/05-vision-studio-try-it-out-drag-and-drop-file.png)

5. Review the list of tags extracted from the image and the confidence score for each in the detected attributes panel. The confidence score is ... Notice in the list of tags that it includes not only objects, but actions, such as `shopping`, `selling`, and `standing`.

## Object detection

In this task, you use the **Object detection** feature of Image Analysis. Object detection detects and extracts bounding boxes based on thousands of recognizable objects and living beings.

1. Return to the home page of Vision Studio, then select the **Detect common objects in images** tile under the **Image analysis** tab.

    ![The Detect common objects in images tile is displayed.](./media/analyze-images-vision/05-vision-studio-image-analysis-detect-common-objects.png)

1. In the **Choose the model you want to try out**, leave **Pretrained Vision model** selected.

1. Open the folder containing the images you downloaded and unzipped and locate the file named `store-camera-3.jpg`.

    ![An image of person with a shopping cart](./media/analyze-images-vision/store-camera-3.jpg)

1. Drag the `store-camera-3.jpg` file into the **Drag and drop a file here** box, or select **Browse for a file** and retrieve the `store-camera-3.jpg` file from the location you saved it to your local computer.

    ![The box for dragging and dropping files is displayed.](./media/analyze-images-vision/05-vision-studio-try-it-out-drag-and-drop-file.png)

1. In the **Detected attributes** box, observe the list of detected objects and their confidence scores.

1. Hover your mouse cursor over the objects in the **Detected attributes** list to highlight the object's bounding box in the image.

1. Move the **Threshold value** slider until a value of 70 is displayed to the right of the slider. Observe what happens to the objects in the list. The threshold slider specifies that only objects identified with a confidence score or probability greater than the threshold should be displayed.

## Clean up
If you don’t intend to do more exercises, delete any resources that you no longer need. This avoids accruing any unnecessary costs.
1.	Open the [Azure portal]( https://portal.azure.com) and select the resource group that contains the resource you created. 
1.	Select the resource and select **Delete** and then **Yes** to confirm. The resource is then deleted.

## Learn more

To learn more about what you can do with this service, see the [Computer Vision page](https://azure.microsoft.com/products/ai-services?activetab=pivot:visiontab).
