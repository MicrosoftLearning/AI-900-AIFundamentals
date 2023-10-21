---
lab:
    title: 'Analyze images in the Vision Studio'
---

Azure AI Vision includes numerous capabilities for understanding image content and context and extracting information from images. Azure AI Vision Studio allows you to try out many of the capabilities of Image Analysis 4.0 quickly and easily in a web browser. 

In this exercise, you will use Vision Studio to analyze images using the built-in try-it-out experiences. 

## Provision Azure resources

Before using Vision Studio to try out the capabilities of Image Analysis 4.0, you must prepare your Azure environment by creating a few resources required to complete the exercises in this module. You will use the Azure portal to provision and configure the following resources:

- A resource group
- An Azure Cognitive Service account
- An Azure Storage account

1. Navigate to the [Azure portal](https://portal.azure.com/) in a web browser, then select **Create a resource**.

    ![Screenshot of the Azure portal with red box around the create a resource button.](../media/05-azure-portal-create-resource.png)

2. Search for and select **Resource Group** in the Marketplace, then select **Create**. Configure the resource group with the following settings:
    - **Subscription**: *Your Azure subscription*
    - **Resource Group**: rg-ms-learn-vision
    - **Region**: (US) East US

    Select **Review + Create**, then select **Create**. 

3. Return to the Azure portal Marketplace. Search for and select **Cognitive Services**, then select **Create**. 

    Configure the resource with the following settings:
    - **Subscription**: *Your Azure subscription*
    - **Resource Group**: rg-ms-learn-vision
    - **Region**: East US
    - **Name**: cog-ms-learn-vision-SUFFIX 
        - *note: replace the SUFFIX token with your initials or another value to ensure the resource name is globally unique.*
    - **Pricing tier**: S0
    - *Acknowledge that you have read and understood the terms by checking the box.*

    Select **Review + Create**, then select **Create**. 
    
    ![Screenshot of the configuration screen to create a Cognitive Services resource.](../media/05-cognitive-services-configuration.png)

    **Note**: Image Analysis 4.0 features are currently available in a limited number of Azure regions. Specifying `East US` ensures access to the 4.0 features from Vision Studio.

4. The last resource you need to create is an Azure Storage account for hosting some of the images you will use to try out the Image Analysis 4.0 features and create your custom object detection model in the next exercise. Return to the Azure portal Marketplace. Search for and select **Storage Account**, then select **Create**. 
Configure the resource with the following settings:
    - **Subscription**: *Your Azure subscription*
    - **Resource Group**: rg-ms-learn-vision
    - **Storage Account Name**: stmslearnvisionSUFFIX 
        - *note: replace the `SUFFIX` token with your initials or another value to ensure the resource name is globally unique.*
    - **Region**: East US
    - **Performance**: Standard
    - **Redundancy**: *check the box 'make read access to data available'*

    Select **Review** and **Create**.  

    ![Screenshot of the configuration screen to create a Storage Account.](../media/05-storage-account-creation.png)

    Once the resource is deployed, select **Go to Resource**.

5. On your storage account resource page, navigate to the left-hand pane. Under **Data Storage**, select **Containers**.

    ![Screenshot of the Data Storage menu header with a red box around the Containers link.](../media/05-container-navigation.png)

6. Create a new container by selecting **+ Container**. 
    
    ![Screenshot of the create a container button on the Containers page.](../media/05-new-container.png)
    
    Configure the container with these settings:
    - **Name**: photo-album
    - **Public access level**: Container (anonymous read access for containers and blobs)

    Select **Create**.

7. Create a second container for hosting the training images you will use in the next exercise. Select **+ Container**. 
Configure the container with these settings:
    - **Name**: training-images
    - **Public access level**: Container (anonymous read access for containers and blobs)
    
    Select **Create**.

8. Repeat the above steps to create a third container for hosting the images you will use in the next exercise to evaluate your custom model. Select **+ Container**. 
Configure the container with these settings:
    - **Name**: evaluation-images
    - **Public access level**: Container (anonymous read access for containers and blobs)

    Select **Create**.

## Configure a CORS rule on the storage account

Before moving on to trying out the Image Analysis 4.0 features from Vision Studio, you must enable CORS on your Storage Account to allow Vision Studio to connect to it and search for images.

1. In the Azure portal browser windows, navigate to the `rg-ms-learn-vision` resource group and select the `stmslearnvisionSUFFIX` Storage Account.

2. On the Storage Account page, scroll down in the left-hand navigation menu and select **Resource sharing (CORS)** under **Settings**.

    ![The Resource Sharing (CORS) menu items is highlighted under the Settings header.](../media/05-azure-portal-storage-account-cors.png)

3. On the **Resource Sharing (CORS)** page, enter the following on the **Blob service** tab:

    - **Allowed origins**: Enter <https://portal.vision.cognitive.azure.com>.
    - **Allowed methods**: Select the **GET** checkbox to allow an authenticated request from a different domain.
    - **Max age**: Enter **9999**.

    ![The Azure Storage Account CORS rule configuration is displayed on the Resource Sharing (CORS) page.](../media/05-azure-portal-storage-account-cors-rule.png)

4. Select **Save** on the **Resource sharing (CORS)** toolbar.

## Download sample images

You will use several images for the exercises below, which you must retrieve from a local folder. In this task, you will download a zip file from a GitHub repository and unzip it to a local directory.

1. Download the zip file containing sample images from here: <https://github.com/MicrosoftLearning/mslearn-cognitive-vision/blob/main/assets/images.zip?raw=true>

2. Unzip the `images.zip` file to an easily accessible location on your local machine.

## Update images to Azure Storage

Some of the images you download need to be added to the Azure Storage account you created above to be accessible by the try-it-out experiences. In this task, you will upload the required images to containers in blob storage.

1. In a web browser, navigate to the [Azure portal](https://portal.azure.com/) and browser to the Storage Account resource in the `rg-ms-learn-vision` resource group you created above, then select **Containers** under **Data storage** in the left-hand navigation menu.

2. Select the 'photo-album' container on the **Containers** page.

    ![On the Azure Storage Account page, Containers is highlighted and selected in the left-hand navigation menu, and the photo-album container is highlighted in the containers list.](../media/05-azure-portal-storage-account-containers-photo-album.png)

3. On the **photo-album** page, select **Upload** from the toolbar.

    ![The Upload button on the storage container toolbar is highlighted.](../media/05-azure-portal-storage-account-containers-upload.png)

4. On the **Upload blob** dialog, select **Browse for files**, navigate to the `photo-album` folder in the `images` folder you downloaded to your local machine, select all the files in the folder, and then select **Open** to add the files to the upload process.

    ![On the Upload blob dialog, Browser for files is highlighted and the Upload button is highlighted.](../media/05-azure-portal-storage-account-upload-photo-album.png)

5. Select **Upload** to upload all files into the `photo-album` container.

    When the upload completes, you should receive a message that 109 blobs were successfully uploaded.

    ![A dialog with the message the 109 blobs were successfully uploaded is displayed.](../media/05-azure-portal-storage-account-upload-photo-album-success.png)

6. Repeat steps 3 through 5 above, this time selecting the `training-images` container and retrieving all of the images from the `training-images` folder in your download location.

    When the upload has finished, you should receive a message that 53 blobs were successfully uploaded.

7. Repeat steps 3 through 5 above, this time selecting the `evaluation-images` container and retrieving all of the files from the `evaluation-images` folder in your download location.

    When the upload completes, you should see a message that 16 blobs were successfully uploaded.

    **Note**: The `evaluation-images` folder also contains a JSON file named `eval-labels.json`. Make sure to upload this file as well. It is the COCO file describing the labels applied to the evaluation image dataset.

## Connect your Cognitive Services resource to Vision Studio

In this task, you will connect the Cognitive Services resource you provisioned above to Vision Studio so it can be used for trying out the various Image Analysis 4.0 features.

1. In a web browser, navigate to [Vision Studio](https://portal.vision.cognitive.azure.com/).

2. Sign in with your account and making sure you are using the same directory as the one where you have created the `cog-ms-learn-vision-SUFFIX` Cognitive Services resource.

3. On the Vision Studio home page, select **View all resources** under the **Getting started with Vision** heading.

    ![The View all resource link is highlighted under Getting started with Vision in Vision Studio.](../media/05-vision-studio-view-all-resources.png)

4. On the **Select a resource to work with** page, hover your mouse cursor over the `cog-ms-learn-vision-SUFFIX` resource you created above in the list and then check the box to the left of the resource name, then select **Select as default resource**.

    ![The Select a resource to work with dialog is displayed with the cog-ms-learn-vision-SUFFIX Cognitive Services resource highlighted and checked. The Select as default resource button is highlighted.](../media/05-vision-studio-select-default-resource.png)

## Generate captions for an image

You are ready to use [Vision Studio](https://portal.vision.cognitive.azure.com/) to examine Image Analysis 4.0 capabilities. In this task, you look at the image captioning functionality of Azure Computer Vision. Image captions are available through the **Caption** and **Dense Captions** features in Image Analysis 4.0.

1. In a web browser, navigate to [Vision Studio](https://portal.vision.cognitive.azure.com/).

2. On the **Getting started with Vision** landing page, select the **Image analysis** tab and then select the **Add captions to images** tile.

    ![On the Vision Studio home page, the Image analysis tab is selected and highlighted. The Add captions to images tile is highlighted.](../media/05-vision-studio-image-analysis-add-captions-to-images.png)

3. Under the **Try It Out** subheading, acknowledge the resource usage policy by reading and checking the box.  

4. Open the folder containing the images you downloaded and unzipped and locate the file named `city-street.jpg` within the `try-it-out` folder.

    ![An image of a city street, with a man walking a dog.](../media/05-city-street.jpg)

5. Drag the `city-street.jpg` image from the `try-it-out` folder into the **Drag and drop files here** box, or browse to the location you downloaded the file and select it.

    ![The box for dragging and dropping files is displayed.](../media/05-vision-studio-try-it-out-drag-and-drop-file.png)

6. Observe the generated caption text, visible in the **Detected attributes** panel to the right of the image.

    The **Caption** functionality provides a single, human-readable English sentence describing the image's content.


8. Next, use the same image to perform **Dense captioning**. Return to the **Vision Studio** home page, and as you did before, select the **Image analysis** tab, then select the **Dense captioning** tile.

    ![The Dense captioning tile is displayed.](../media/05-vision-studio-image-analysis-dense-captioning.png)

    The **Dense Captions** feature of Image Analysis 4.0 differs from the **Caption** capability in that it provides multiple human-readable captions for an image, one describing the image's content and others, each covering the essential objects detected in the picture. Each detected object includes a bounding box, which defines the pixel coordinates within the image associated with the object.

9. Drag the `city-street.jpg` image from the `try-it-out` folder into the **Drag and drop files here** box, or browse to the location you downloaded the file and select it.

    ![The box for dragging and dropping files is displayed.](../media/05-vision-studio-try-it-out-drag-and-drop-file.png)

10. Hover over one of the captions in the **Detected** attributes list and observe what happens within the image.

    ![The city-street.jpg image and its captions are displayed. The third caption, "A yellow car on the street," is highlighted, and the associated bounding box in the image is highlighted with the caption displayed.](../media/05-vision-studio-dense-captioning-bounding-boxes.png)

    Move your mouse cursor over the other captions in the list, and notice how the bounding box shifts in the image to highlight the portion of the image used to generate the caption.



## Tagging images

The next feature you will try is the **Extract Tags** functionality of Image Analysis 4.0. Extract tags is based on thousands of recognizable objects, including living beings, scenery, and actions.

1. Return to the home page of Vision Studio, then select the **Extract common tags from images** tile under the **Image analysis** tab.

    ![The Extract common tags from images tile is displayed.](../media/05-vision-studio-image-analysis-extract-common-tags.png)

2. In the **Choose the model you want to try out**, leave **Pretrained Vision model** selected. In the **Choose your language**, select **English** or a language of your preference.

3. Open the folder containing the images you downloaded and unzipped and locate the file named `shopping.jpg` within the `try-it-out` folder.

4. Drag the `shopping.jpg` file into the **Drag and drop a file here** box, or select **Browse for a file** and retrieve the `shopping.jpg` file from the location you saved it to your local computer.

    ![The box for dragging and dropping files is displayed.](../media/05-vision-studio-try-it-out-drag-and-drop-file.png)

5. Review the list of tags extracted from the image and the confidence score for each in the detected attributes panel.

    | Image | Tags  |
    | :---: | :---: |
    | ![A person shopping in a grocery store.](../media/05-shopping.jpg) | ![Tags generated for the image of a person shopping in a grocery stor .](../media/05-image-tags.png)

    Notice in the list of tags that it includes not only objects, but actions, such as `shopping`, `selling`, and `standing`.

## Object detection

In this task, you use the **Object detection** feature of Image Analysis. Object detection detects and extracts bounding boxes based on thousands of recognizable objects and living beings.

1. Return to the home page of Vision Studio, then select the **Detect common objects in images** tile under the **Image analysis** tab.

    ![The Detect common objects in images tile is displayed.](../media/05-vision-studio-image-analysis-detect-common-objects.png)

2. In the **Choose the model you want to try out**, leave **Pretrained Vision model** selected.

3. Open the folder containing the images you downloaded and unzipped and locate the file named `road-scene.jpg` within the `try-it-out` folder.

4. Drag the `road-scene.jpg` file into the **Drag and drop a file here** box, or select **Browse for a file** and retrieve the `road-scene.jpg` file from the location you saved it to your local computer.

    ![The box for dragging and dropping files is displayed.](../media/05-vision-studio-try-it-out-drag-and-drop-file.png)

5. In the **Detected attributes** box, observe the list of detected objects and their confidence scores.

6. Hover your mouse cursor over the objects in the **Detected attributes** list to highlight the object's bounding box in the image.

7. Move the **Threshold value** slider until a value of 70 is displayed to the right of the slider. Observe what happens to the objects in the list.

    The threshold slider specifies that only objects identified with a confidence score or probability greater than the threshold should be displayed.



Congratulations! You have successfully used Vision Studio.


# Explore Computer Vision

> **Note**
> To complete this lab, you will need an [Azure subscription](https://azure.microsoft.com/free?azure-portal=true) in which you have administrative access.

The *Computer Vision* service uses pre-trained machine learning models to analyze images and extract information about them.

For example, suppose the fictitious retailer *Northwind Traders* has decided to implement a "smart store", in which AI services monitor the store to identify customers requiring assistance, and direct employees to help them. By using the Computer Vision service, images taken by cameras throughout the store can be analyzed to provide meaningful descriptions of what they depict.

In this lab, you'll use a simple command-line application to see the Computer Vision service in action. The same principles and functionality apply in real-world solutions, such as web sites or phone apps.

## Create an *Azure AI services* resource

You can use the Computer Vision service by creating either a **Computer Vision** resource or an **Azure AI services** resource.

If you haven't already done so, create an **Azure AI services** resource in your Azure subscription.

1. In another browser tab, open the Azure portal at [https://portal.azure.com](https://portal.azure.com?azure-portal=true), signing in with your Microsoft account.

1. Click the **&#65291;Create a resource** button and search for *Azure AI services*. Select **create** an **Azure AI services** plan. You will be taken to a page to create an Azure AI services resource. Configure it with the following settings:
    - **Subscription**: *Your Azure subscription*.
    - **Resource group**: *Select or create a resource group with a unique name*.
    - **Region**: *Choose any available region*.
    - **Name**: *Enter a unique name*.
    - **Pricing tier**: Standard S0
    - **By checking this box I acknowledge that I have read and understood all the terms below**: Selected.

1. Review and create the resource, and wait for deployment to complete. Then go to the deployed resource.

1. View the **Keys and Endpoint** page for your Azure AI services resource. You will need the endpoint and keys to connect from client applications.



1. Review the results of the image analysis, which include:
    - A suggested caption that describes the image.
    - A list of objects identified in the image.
    - A list of "tags" that are relevant to the image.

1. Now let's try another image:

    ![An image of person with a shopping basket in a supermarket](media/analyze-images-computer-vision-service/store-camera-2.jpg)

    To analyze the second image, enter the following command:

    ```PowerShell
    ./analyze-image.ps1 store-camera-2.jpg
    ```

1. Review the results of the image analysis for the second image.

1. Let's try one more:

    ![An image of person with a shopping cart](media/analyze-images-computer-vision-service/store-camera-3.jpg)

    To analyze the third image, enter the following command:

    ```PowerShell
    ./analyze-image.ps1 store-camera-3.jpg
    ```

1. Review the results of the image analysis for the third image.

## Learn more

This simple app shows only some of the capabilities of the Computer Vision service. To learn more about what you can do with this service, see the [Computer Vision page](https://azure.microsoft.com/products/ai-services?activetab=pivot:visiontab).

