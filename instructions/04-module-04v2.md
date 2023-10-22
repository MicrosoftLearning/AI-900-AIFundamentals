---
lab:
    title: 'Extract form data in Document Intelligence Studio​'
---

# Extract form data in Document Intelligence Studio

> **Note**
> To complete this lab, you will need an [Azure subscription](https://azure.microsoft.com/free?azure-portal=true) in which you have administrative access.

One of the services of Azure AI Document Intelligence is being able to analyze specific types of documents.  A common use of artificial intelligence (AI) is optical character recognition (OCR) for reading printed or handwritten documents. However, OCR extracts text in an unstructured format which is difficult to store in a database or analyze.

The Document Intelligence service can extract information from forms such as receipts or invoices.  It not only extracts information, but also identifies field names for the data. For example, it can identify a merchant’s name and address on a receipt. The prebuilt models in Document Intelligence are trained to recognize data for each type of document.
 
Azure AI Document Intelligence uses prebuilt machine learning models trained to extract text from images of invoices, receipts, and more. While other computer vision models can capture text, Document Intelligence also captures the structure of the text, such as key/value pairs and information in tables. This way, instead of having to manually type in entries from a form into a database, you can automatically capture the relationships between text from the original file.

In this exercise you’ll use Document Intelligence Studio to try out the capabilities of the AI Document Intelligence service, without writing any code. 

!NOTE: Azure AI Document Intelligence is the new name for Azure Form Recognizer. You may still see Azure Form Recognizer in the Azure portal or Document Intelligence Studio while the name change is being completed.

## Create an *Azure AI services* resource

You can use the Form Recognizer service by creating either a **Form Recognizer** resource or an **Azure AI services** resource.

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

## Create an Azure AI Document Intelligence resource
You can use the AI Document Intelligence service by using either an AI Document Intelligence resource or an Azure AI services resource. In this exercise, you will create an Azure AI Document Intelligence resource, if you don’t already have one.
1.	In another browser tab, open the Document Intelligence Studio, signing in with your Microsoft account.
2.	Select Settings and select the Resource tab. Select Create a new resource. 

 

3.	On the Create resource dialog box, enter the following:
o	Subscription: Your Azure subscription.
o	Resource group: Select or create a resource group with a unique name.
o	New resource name: Enter a unique name.
o	Location: Select a region.
o	Pricing tier: Free FO (if available, otherwise select Standard SO).
4.	Select Continue and then Finish. Wait for the resource to be deployed.
!Note : If your resource is not yet displayed, you may need to Refresh the page.
Keep Document Intelligence Studio open.
Analyze a receipt in Document Intelligence Studio
You are now ready to analyze a receipt for the fictitious Northwind Traders retail company.
1.	Select the image below, then right click and select Save as Picture. Navigate to a folder on your computer and then select Save. Make a note of the image and folder names.

    ![This is an image of a receipt.](media/analyze-receipts/receipt.jpg)

2.	Select Form Recognizer Studio to return to the Get Started with Document Intelligence Studio page, and under Receipts select Try it out.
3.	In the Prebuilt drop-down list, make sure that Receipts is selected.
4.	Select Browse for files and navigate to the folder where you saved the picture. Select the picture of the receipt and then Open. The image appears on the left side of the screen.
5.	On the right, select Run analysis.
6.	When the analysis has run, the results are returned. Notice that the service has recognized specific data fields such as the merchant’s name, the address, phone number, and the transaction date and time, as well as the line items, subtotal, tax, and total amounts. Next to each field is a percentage probability that the field is correct.

In this exercise you have used the Document Intelligence Studio to create a Document Intelligence resource. You then used the service to analyze a receipt. From the results that were returned, you saw how Document Intelligence was able to identify specific fields, enabling data from everyday documents to be more easily processed. Before you close Document Intelligence Studio, why not try some of the sample receipts, including those in different languages?

## Clean up
If you don’t intend to do more exercises, delete any resources that you no longer need. This avoids accruing any unnecessary costs.
1.	Open the Azure portal and select the resource group that contains the AI Document Intelligence resource you created. 
2.	Select the Document Intelligence resource and select Delete and then Yes to confirm. The resource is then deleted.

## Learn more

This simple app shows only some of the Form Recognizer capabilities of the Computer Vision service. To learn more about what you can do with this service, see the [Form Recognizer page](https://docs.microsoft.com/azure/applied-ai-services/form-recognizer/overview).

