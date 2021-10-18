The *Computer Vision* cognitive service uses pre-trained machine learning models to analyze images and extract information about them.

For example, suppose the fictitious retailer *Northwind Traders* has decided to implement a "smart store", in which AI services monitor the store to identify customers requiring assistance, and direct employees to help them. By using the Computer Vision service, images taken by cameras throughout the store can be analyzed to provide meaningful descriptions of what they depict.

In this lab, you'll use a simple command-line application to see the Computer Vision service in action. The same principles and functionality apply in real-world solutions, such as web sites or phone apps.

1. Click the **Activate Sandbox** button at the top of the page. This starts a Cloud Shell instance. 

2. If you are prompted to review permissions, click **Accept**. 

## Create a *Computer Vision* resource

Let's create a **Computer Vision** resource in your Azure subscription:

1. In another browser tab, open the Azure portal at [https://portal.azure.com](https://portal.azure.com?azure-portal=true), signing in with your Microsoft account.
2. Click the **&#65291;Create a resource** button, search for *Computer Vision*, and create a **Computer Vision** resource with the following settings:
    - **Subscription**: *Your Azure subscription or Concierge Subscription*. 
    - **Resource group**: *Select an existing resource group or create a new one*.
    - **Region**: *Choose any available region*
    - **Name**: *Enter a unique name*.
    - **Pricing tier**: Free F0
    - **Responsible AI Notice**: *Scroll down if necessary, and select the checkbox to confirm you have read the notice*.

3. Review and create the resource, and wait for deployment to complete. Then go to the deployed resource.

4. View the **Keys and Endpoint** page for your Computer Vision resource. You will need the endpoint and keys to connect from client applications.

## Configure and run a client application

Now that you have a resource, you can run a simple client application that uses the Computer Vision service to analyze an image.

1. In the command shell, enter the following command to download the sample application and save it to a folder called ai-900.

    ```
    git clone https://github.com/MicrosoftLearning/AI-900-AIFundamentals ai-900
    ```

2. The files are downloaded to a folder named **ai-900**. Now we want to see all of the files in your Cloud Shell storage and work with them. Type the following command into the shell: 

     ```
    code .
    ```

    Notice how this opens up an editor. 

3. In the **Files** pane on the left, expand **ai-900** and select **analyze-image.ps1**. This file contains some code that uses the Computer Vision service to analyze an image, as shown here:

    ![The editor containing code to analyze an image](../media/analyze-image-code.png)

4. Don't worry too much about the code, the important thing is that it needs the endpoint URL and either of the keys for your Computer Vision resource. Copy these from the **Keys and Endpoints** page for your resource from the Azure portal and paste them into the code editor, replacing the **YOUR_ENDPOINT** and **YOUR_KEY** placeholder values respectively.

    > [!TIP] 
    > You need to go back to the Azure Portal for your **Keys and Endpoint**.

5. At the top right of the editor pane, use the **...** button to open the menu and select **Save** to save your changes. 

    The sample client application will use your Computer Vision service to analyze the following image, taken by a camera in the Northwind Traders store:

    ![An image of a parent using a cellphone camera to take a picture of a child in in a store](../media/store-cam1.jpg)

6. In the PowerShell pane, enter the following commands to run the code:

    ```
    cd ai-900
    ./analyze-image.ps1 store-cam1.jpg
    ```

7. Review the results of the image analysis, which include:
    - A suggested caption that describes the image.
    - A list of objects identified in the image.
    - A list of "tags" that are relevant to the image.

8. Now let's try another image:

    ![An image of person with a shopping basket in a supermarket](../media/store-cam2.jpg)

    To analyze the second image, enter the following command:

    ```
    ./analyze-image.ps1 store-cam2.jpg
    ```

9. Review the results of the image analysis for the second image.

10. Let's try one more:

    ![An image of person with a shopping cart](../media/store-cam3.jpg)

    To analyze the third image, enter the following command:

    ```
    ./analyze-image.ps1 store-cam3.jpg
    ```

11. Review the results of the image analysis for the third image.

## Learn more

This simple app shows only some of the capabilities of the Computer Vision service. To learn more about what you can do with this service, see the [Computer Vision page](https://azure.microsoft.com/services/cognitive-services/computer-vision/).
