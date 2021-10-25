Increasingly, we expect computers to be able to use AI in order to understand spoken or typed commands in natural language. For example, you might want to implement a home automation system that enables you to control devices in your home by using voice commands such as "switch on the light" or "put the fan on", and have an AI-powered device understand the command and take appropriate action.

To test the capabilities of the Language Understanding service, we'll use a simple command-line application that runs in the Cloud Shell. The same principles and functionality apply in real-world solutions, such as web sites or phone apps.

## Create a *Cognitive Services* resource

You can use the Translation service by creating either a **Translator** resource or a **Cognitive Services** resource.

If you haven't already done so, create a **Cognitive Services** resource in your Azure subscription.

1. In another browser tab, open the Azure portal at [https://portal.azure.com](https://portal.azure.com?azure-portal=true), signing in with your Microsoft account.
2. Click the **&#65291;Create a resource** button, search for *Cognitive Services*, and create a **Cognitive Services** resource with the following settings:
    - **Subscription**: *Your Azure subscription*.
    - **Resource group**: *Select or create a resource group with a unique name*.
    - **Region**: *Choose any available region*:
    - **Name**: *Enter a unique name*.
    - **Pricing tier**: S0
    - **I confirm I have read and understood the notices**: Selected.

3. Review and create the resource, and wait for deployment to complete. Then go to the deployed resource.
4. View the **Keys and Endpoint** page for your Cognitive Services resource. You will need the endpoint and keys to connect from client applications.

### Create a Language Understanding App

To implement natural language understanding with Language Understanding, you create an app; and then add entities, intents, and utterances to define the commands you want the app to understand:

1. In a new browser tab, open the Language Understanding portal at [https://www.luis.ai](https://www.luis.ai?azure-portal=true), and sign in using the Microsoft account associated with your Azure subscription. If this is the first time you have signed into the Language Understanding portal, you may need to grant the app some permissions to access your account details. Then complete the *Welcome* steps by selecting the existing Language Understanding authoring resource you just created in your Azure subscription. 
2. In the **Conversation apps** page, create a new app with the following settings:
    - **Name**: Home Automation
    - **Culture**: English
    - **Description**: Simple home automation
    - **Prediction resource**: *Your Language Understanding prediction resource*
3. If a panel with tips for creating an effective Language Understanding app is displayed, close it.

### Create intents and entities

An *intent* is an action you want to perform - for example, you might want to switch a light on, or turn a fan off. In this case, you'll define two intents: one to switch a device on, and another to switch a device off. For each intent, you'll specify sample *utterances* that indicate the kind of language used to indicate the intent.

1. In the pane on the left, ensure that **Intents** is selected Then click **Create**, and add an intent with the name **switch_on** (in lower-case) and click **Done**.
2. Under the **Examples** heading and the **Example user input** subheading, type the utterance ***turn the light on*** and press **Enter** to submit this utterance to the list.
3. In the *turn the light on* utterance, select the word "light". Then in the list that appears, in the *Enter an entity name* box type **device** (in lower-case) and select ***device* Create new entity**, as shown here:

    ![The work "Light" is selected and a menu provides the option to search for or create an entity](../media/create-intent.png)

4. In the **Create an Entity** dialog box that is displayed, create a **machine learned** entity named **device*.

    ![Create an Machine learned entity named device ](../media/create-entity.png)

5. Back in the page for the **switch_on** intent, create a second utterance with the phrase ***switch on the fan***. Then select the word "fan" and assign it to the **device** entity you created previously.
6. In the pane on the left, click **Intents** and verify that your **switch_on** intent is listed along with the default **None** intent, Then click **Create** and add a new intent with the name **switch_off** (in lower-case).
7. In the page for the **switch_off** intent, add the utterance ***turn the light off*** and assign the word "light" to the **device** entity.
8. Add a second utterance to the **switch_off** intent, with the utterance ***switch off the fan***. Then connect the word "fan" to the **device** entity.

### Train and Test the Language Model

Now you're ready to use the intents and entities you have defined to train the language model for your app.

1. At the top of the Language Understanding page for your app, click **Train** to train the language model
2. When the model is trained, click **Test**, and use the test pane to view the predicted intent for the following phrases, noting the predicted intent and *inspecting* the details to identify predicted ML entities.
    * *switch the light on*
    * *turn off the fan*
    * *put the light on*
    * *put the fan off*
3. Close the Test pane.

### Publish the Model and Configure Endpoints

To use your trained model in a client application, you must publish it as an endpoint to which the client applications can send new utterances; from which intents and entities will be predicted.

1. At the top of the Language Understanding page for your app, click **Publish**. Then select **Production slot** and click **Done**.
2. After the model has been published, at the top of the Language Understanding page for your app, click **Manage**. Then on the **Settings** tab, note the **Application ID** for your app. You will need this value later.
3. On the **Azure Resources** tab, note the **Primary key** and **Endpoint URL** for your prediction resource. You will also need these later.

## Use your Language Understanding app from a client

To consume your language model from a client, we'll use a simple command-line application that runs in the Cloud Shell provided with your Azure subscription.

## Run Cloud Shell 

To test the capabilities of the Language Understanding service, we'll use a simple command-line application that runs in the Cloud Shell on Azure. 

1. In the Azure portal, select the **[>_]** (*Cloud Shell*) button at the top of the page to the left of the search box. This opens a Cloud Shell pane at the bottom of the portal, as shown here.

    ![Azure cloud shell pane](./media/cloud-shell.png)

2. The first time you open the cloud shell, you will be prompted to choose the type of shell you want to use (*Bash* or *PowerShell*). Select **PowerShell**.

3. If you are prompted to create storage for your cloud shell, ensure your subscription is specified and select **Create storage**. Then wait a minute or so for the storage to be created. Eventually, the cloud shell pane will display a command prompt like this:

    ![Azure cloud shell PowerShell prompt](./media/powershell-prompt.png)

    > **Note**: If you selected *Bash*, or you had previously opened a Bash cloud shell, you can switch to PowerShell by using the drop-down menu at the top left of the cloud shell pane.


## Configure and run a client application

Now that you have a custom model, you can run a simple client application that uses the Language Understanding service.

1. In the command shell, enter the following command to download the sample application and save it to a folder called ai-900.

    ```
    git clone https://github.com/MicrosoftLearning/AI-900-AIFundamentals ai-900
    ```

2. The files are downloaded to a folder named **ai-900**. Now we want to see all of the files in your Cloud Shell storage and work with them. Type the following command into the shell: 

     ```
    code .
    ```

    Notice how this opens up an editor. 

3. In the **Files** pane on the left, expand **ai-900** and select **understand.ps1**. This file contains some code that uses your Language Understanding model, as shown here:

    ![The editor containing code to use a Language Understanding app](../media/understand-code.png)

4. Don't worry too much about the details of the code, the important thing is that it needs the application ID, key, and endpoint URL for your published language model. Copy these from the **Manage** page in th Language Understanding portal from the Azure portal and paste them into the code editor, replacing the **YOUR_APP_ID**, **YOUR_PRIMARY_KEY** and **YOUR_ENDPOINT_URL** placeholder values respectively.

5. At the top right of the editor pane, use the **...** button to open the menu and select **Save** to save your changes. Then open the menu again and select **Close Editor**.
6. In the PowerShell pane, enter the following command to run the code:

    ```
    cd ai-900
    ./understand.ps1 "Turn on the light"
    ```

7. Review the results. The app should have predicted that the intended action is to switch on the light.
8. Now try another command:

    ```
    ./understand.ps1 "Switch the fan off"
    ```

9. Review the results from this command. The app should have predicted that the intended action is to switch off the fan.

10. Experiment with a few more commands; including commands that the model was not trained to support, such as "Hello" or "switch on the oven". The app should generally understand commands for which its language model is defined, and fail gracefully for other input.

## Learn more

This simple app shows only some of the capabilities of the Language Understanding service. To learn more about what you can do with this service, see the [Language Understanding page](https://azure.microsoft.com/services/cognitive-services/language-understanding-intelligent-service//).

