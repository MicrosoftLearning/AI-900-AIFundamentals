In the artificial intelligence (AI) field of computer vision, optical character recognition (OCR) is commonly used to read printed or handwritten documents. Often, the text is simply extracted from the documents into a format that can be used for further processing or analysis.

A more advanced OCR scenario is the extraction of information from forms, such as purchase orders or invoices, with a semantic understanding of what the fields in the form represent. The **Form Recognizer** service is specifically designed for this kind of AI problem.

Form Recognizer uses machine learning models trained to extract text from images of invoices, receipts, and more. While other computer vision models can capture text, Form Recognizer also captures the structure of the text, such as key/value pairs and information in tables. This way, instead of having to manually type in entries from a form into a database, you can automatically capture the relationships between text from the original file. 

To test the capabilities of the Form Recognizer service, we'll use a simple command-line application that runs in the Cloud Shell. The same principles and functionality apply in real-world solutions, such as web sites or phone apps.

1. Click the **Activate Sandbox** button at the top of the page. This starts a Cloud Shell instance and gives you access to an Azure subscription. 

2. If you are prompted to review permissions, click **Accept**.

## Create a Form Recognizer resource

> [!NOTE]
> You can either use a Cognitive Service resource or a Form Recognizer resource to access Form Recognizer services. 

To create a Form Recognizer resource in your Azure subscription:

1. In another browser tab, open the Azure portal at [https://portal.azure.com](https://portal.azure.com?azure-portal=true), signing in with your Microsoft account.
2. Select **+ Create a resource**, and search for *Form Recognizer*.
3. In the list of services, select **Form Recognizer**.
4. In the **Form Recognizer** blade, select **Create**.
5. In the **Create** blade, enter the following details and select **Create**
   - **Name**: A unique name for your service
   - **Subscription**: Your Azure subscription
   - **Region**: Any available region
   - **Pricing tier**: F0
   - **Resource Group**: The existing resource group you used previously
   - **I confirm I have read and understood the notice below**: Selected.
6. Review and create the resource, and wait for deployment to complete. Then go to the deployed resource.
7. View the **Keys and Endpoint** page for your resource. This is located on the left hand side of the pane. You will need the endpoint and keys to connect from client applications.

## Configure and run a client application

Now that you have a resource, you can run a simple client application that uses the Computer Vision service to analyze an image.

1. In the command shell, enter the following command to download the sample application and save it to a folder called ai-900.

    ```
    git clone https://github.com/MicrosoftLearning/AI-900-AIFundamentals ai-900
    ```

2. The files are downloaded to a folder named **ai-900**. Now we want to see all of the files in the Cloud Shell storage and work with them. Type the following command into the shell: 

     ```
    code .
    ```

    Notice how this opens up an editor. 

3. In the **Files** pane on the left, expand **ai-900** and select **form-recognizer.ps1**. This file contains some code that uses the Form Recognizer service to analyze the fields in a receipt, as shown here:

    ![The editor containing code to analyze fields in a receipt.](../media/recognize-receipt-code.png)

4. Don't worry too much about the details of the code, the important thing is that it needs the endpoint URL and either of the keys for your Form Recognizer resource. Copy these from the **Keys and Endpoints** page for your resource from the Azure portal and paste them into the code editor, replacing the **YOUR_ENDPOINT** and **YOUR_KEY** placeholder values respectively.

5. At the top right of the editor pane, use the **...** button to open the menu and select **Save** to save your changes. Then open the menu again and select **Close Editor**. Now that you've set up the key and endpoint, you can use your resource to analyze fields from a receipt. In this case, you'll use the Form Recognizer's built-in model to analyze a receipt for the fictional Northwind Traders retail company.

    The sample client application will analyze the following image:

    ![This is an image of a receipt.](../media/receipt.jpg)

6. In the PowerShell pane, enter the following commands to run the code to read the text:

    ```
    cd ai-900
    ./form-recognizer.ps1 
    ```

7. Review the returned results. See that Form Recognizer is able to interpret the data in the form, correctly identifying the merchant address and phone number, and the transaction date and time, as well as the line items, subtotal, tax, and total amounts.

## Learn more

This simple app shows only some of the Form Recognizer capabilities of the Computer Vision service. To learn more about what you can do with this service, see the [Form Recognizer page](https://docs.microsoft.com/azure/applied-ai-services/form-recognizer/overview).


