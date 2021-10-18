For customer support scenarios, it's common to create a bot that can interpret and answer frequently asked questions through a website chat window, email, or voice interface. Underlying the bot interface is a knowledge base of questions and appropriate answers that the bot can search for suitable responses.

To test a QnA Maker Knowledge Base, we will activate a free subscription in the sandbox. 

1. Click the **Activate Sandbox** button at the top of the page. This starts a Cloud Shell instance.  

2. If you are prompted to review permissions, click **Accept**.

## Create a QnA Maker Knowledge Base
The QnA Maker service is a cognitive service in Azure that enables you to quickly create a knowledge base, either by entering question and answer pairs or from an existing document or web page. It can then use some built-in natural language processing capabilities to interpret questions and find appropriate answers.

1. Open the QnA Maker portal at [https://qnamaker.ai](https://qnamaker.ai?azure-portal=true). Sign in using the Microsoft account associated with your Azure subscription.
2. In the QnA Maker portal, select **Create a knowledge base**.
3. If you haven't previously created a QnA service resource, select the **Preview** option and then click **Create a QnA service**. The Azure portal will be opened in another tab so you can create a QnA Maker service in your subscription.
4. In the **Select additional features** page, select **Custom question answering**. Then click **Continue to create your resource**.
5. Enter the following settings, and then select **Review and create**:
    - **Subscription**: *Your Azure subscription*
    - **Resource group**: *Select an existing resource group or create a new one*
    - **Name**: *A unique name for your QnA resource*
    - **Pricing tier**: Standard S
    - **Azure Search location**: *Any available location*
    - **Azure Search pricing tier**: Free F
    - Notices. If any notices are displayed, select the appropriate checkboxes to state you have read them.

    > [!NOTE] 
    > If you have already provisioned a free-tier **Azure Cognitive Search** resources, your quota may not allow you to create another one. In which case, select a tier other than **F**.

4. Click **Create** and wait for the deployment of the Text Analytics Service that will support your QnA knowledge base.
5. Return to the QnA Maker portal tab, and in the **Step 2** section, click **Refresh** to refresh the list of available QnA service resources.
6. Connect your QnA service to your KB by selecting the following options:
    - **Microsoft Azure Directory ID**: *The Azure directory ID for your subscription*
    - **Azure subscription name**: *Your Azure subscription*
    - **Azure QnA service**: *The QnA service resource you created in the previous step*
    - **Language**: English

    > [!TIP]
    > If a message stating that the role does not have permission to perform the action is displayed, refresh the browser page for the QnA Maker portal.

7. In the **Step 3** section, enter the name **Margie's Travel KB**.
8. In the **Step 4** section, in the **URL** box, type `https://raw.githubusercontent.com/MicrosoftLearning/AI-900-AIFundamentals/main/data/qna/margies_faq.docx` and click **+ Add URL**. Then under **Chit-chat**, select **Professional**.
9. In the **Step 5** section, click **Create your KB**.
10. Wait for a minute or so while your Knowledge base is created. Then review the questions and answers that have been imported from the FAQ document and the professional chit-chat pre-defined responses.

## Edit the Knowledge Base

Your knowledge base is based on the details in the FAQ document and some pre-defined responses. You can add custom question-and-answer pairs to supplement these.

1. Click **+ Add QnA pair**.
2. In the **Question** box, type `Hello`. Then click **+ Add alternative phrasing** and type `Hi`.
3. In the **Answer** box, type `Hello`.

## Train and Test the Knowledge Base

Now that you have a knowledge base, you can test it in the QnA Maker portal.

1. At the top right of the page, click **Save and train** to train your knowledge base. You may need to change the size of your window to see the button.
2. After training has completed, click **&larr; Test** to open the test pane.
3. In the test pane, at the bottom enter the message *Hi*. The response **Hello** should be returned.
4. In the test pane, at the bottom enter the message *I want to book a flight*. An appropriate response from the FAQ should be returned.

    > [!NOTE]
    > The response includes a *short answer* as well as a more verbose *answer passage* - the answer passage shows the full text in the FAQ document for the closest matched question, while the short answer is intelligently extracted from the passage. You can control whether the short answer from the response by using the **Display short answer** checkbox at the top of the test pane.

5. Try another question, such as *How can I cancel a reservation?*
6. When you're done testing the knowledge base, click **&rarr; Test** to close the test pane.

## Publish and use the Knowledge Base

The knowledge base provides a back-end service that client applications can use to answer questions through some sort of user interface. Commonly, these client applications are bots. To make the knowledge base available to a bot, you must publish it as a service that can be accessed over HTTP. You can then use the Azure Bot Service to create and host a bot that uses the knowledge base to answer user questions.

> [!IMPORTANT] 
> The sandbox environment you are using does not support creating a Web App Bot in the subscription. In the future if you wanted to publish a bot in your personal subscription, you can follow these steps.

- Publish the Knowledge Base from the QnA Make page. 

- After the service has been deployed, create a bot in the Azure portal. 

- Test your client. Once your bot is created, go back to the resource. In the left-hand pane of your bot look for **Settings**, click on **Test in Web Chat**, and wait until the bot displays the message **Hello and welcome!** (it may take a few seconds to initialize). Use the test chat interface to ensure your bot answers questions from your knowledge base as expected. For example, try submitting *I need to cancel my hotel*.



