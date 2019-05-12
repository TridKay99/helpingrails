# README

1. What is the need (i.e. challenge) that you will be addressing in your project?
#CONTINUE...
The main challenege throughout our project was creating two user groups using Devise. Not creating these two user groups initially through Devise resulted in a restart of our project. Seperating the user into two classes, Customer and Worker

Looking back on the whole situation We decided that it was better to restart rather than run multiple g migrations until we had what we wanted. 



2. Identify the problem you’re trying to solve by building this particular marketplace App? Why is it a problem that needs solving?

I simple problem in life is the unfortunate process of moving something from point A to point B. None of your friends have a pick up truck. This app allows you, as the customer, to place your situation on our website as a 'job'. You will be connected to a worker that accepts your job and in result, come and help you move it. Now imagine you have multiple other jobs in different categories. i.e Fixing a chair or painting a fence. Post whatever job you need completed and some saviour will come help you out. 
I find this is a problem that needs solved not just because im lazy. But sometimes I don't have the necessary tools, equipment or skills to complete the job.



3. Describe the project will you be conducting and how. your App will address the needs.

The project we will be conducting will be focused around the idea of helping others out. In that sense, the creation of a linked application between Customers and Workers through the idea of jobs, we'd like to see problems overcome and issues dealt with with the solution of hard work.



4. Describe the network infrastructure the App may be based on.

The basic network infrastructure our app is based on two types of users, Customers and Workers. These two users are connected through their common relation in the 'Job'. Customer will post and a job and a worker will except and in turn, these two users will be connected together. Involved in this transaction is pathways that can take the respective users to each others profiles, to a list of jobs and to your own profile that will show you your list of jobs. 
List of jobs will show two possible pages depending on if you're a Worker or Customer. Worker will see the jobs he has accepted. Customer will see the job he has  posted with a boolean that works with true or false to prompt us if the job is accepted or unaccepted. External networks involved in helping out our transaction period is Mailgun, to send confirmationof a jobs creation. And Stripe that helps us handle our transactions and transaction records as well as some code throughout out project.


5. Identify and describe the software to be used in your App.

6. Identify the database to be used in your App and provide a justification for your choice.

7. Identify and describe the production database setup.
After creating the "rails new" with a postgres database the controllers and models needed to be set up. The database setup for our project 'HelpingHand' require two devise controllers - Customers and Workers. This replaces the default example of 'Users'.