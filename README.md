# README

link to git hub repo : https://github.com/TridKay99/helpingrails
URL link : https://damp-forest-41444.herokuapp.com/

1. What is the need (i.e. challenge) that you will be addressing in your project?
The main challenege throughout our project was creating two user groups using Devise. Not creating these two user groups initially through Devise resulted in a restart of our project. Customer will be finding a Worker to get their necessary 'job' done.


2. Identify the problem you’re trying to solve by building this particular marketplace App? Why is it a problem that needs solving?
I simple problem in life is the unfortunate process of moving something from point A to point B. None of your friends have a pick up truck. This app allows you, as the customer, to place your situation on our website as a 'job'. You will be connected to a worker that accepts your job and in result, come and help you move it. Now imagine you have multiple other jobs in different categories. i.e Fixing a chair or painting a fence. Post whatever job you need completed and some saviour will come help you out. 
I find this is a problem that needs solved not just because im lazy. But sometimes I don't have the necessary tools, equipment or skills to complete the job.



3. Describe the project will you be conducting and how. your App will address the needs.
The project we will be conducting will be focused around the idea of helping others out. In that sense, the creation of a linked application between Customers and Workers through the idea of jobs, we'd like to see problems overcome and issues dealt with with the solution of hard work.



4. Describe the network infrastructure the App may be based on.
The basic network infrastructure our app is based on two types of users, Customers and Workers. These two users are connected through their common relation in the 'Job'. Customer will post and a job and a worker will except and in turn, these two users will be connected together. Involved in this transaction is pathways that can take the respective users to each others profiles, to a list of jobs and to your own profile that will show you your list of jobs. 
List of jobs will show two possible pages depending on if you're a Worker or Customer. Worker will see the jobs he has accepted. Customer will see the job he has  posted with a boolean that works with true or false to prompt us if the job is accepted or unaccepted. External networks involved in helping out our transaction period is Mailgun, to send confirmationof a jobs creation. And Stripe that helps us handle our transactions and transaction records as well as some code throughout out project.


5. Identify and describe the software to be used in your App.
Many gems have been invovled in making this application come to life. Mainly bootstrap, devise, and mailer.
Launching up onto heroku to display our website on your local machine. Heroku requires a gem installed and bundle installed as well. 


6. Identify the database to be used in your App and provide a justification for your choice.
The database we used was Postgres. This is due to it beind easily capable of adding data types to the database.

7. Identify and describe the production database setup.
After creating the "rails new" with a postgres database the controllers and models needed to be set up. The database setup for our project 'HelpingHand' require two devise controllers - Customers and Workers. This replaces the default example of 'Users'.

8. Describe the architecture of your App.
The architecture is based around our wireframes created on figma. Going from home back to sign up page, to profile page and from there using the navbar to head to a page that lists all the jobs for you to choose from.

9. Explain the different high-level components (abstractions) in your App.
The highest level of abstraction is the application itself. Beneath that is a fair few models we have created.
This includes customer_review, customer, worker_review, worker, job and ability.

10. Detail any third party services that your App will use.
"HelpingHand" is using mailgun and stripe to allow the process of notification and payments. 

11. Describe (in general terms) the data structure of marketplace apps that are similar to your own (e.g. eBay, Airbnb).
A very similar application is AirTasker which connects people together to settle on a price for a job to make life easy for some and to give others a job. When you post a task, they askfor a budget to be set and ask how much you'd like to spend. The amount is a starting point for a budding auction type style to reach a fair price.

12. Discuss the database relations to be implemented.
Three main tables in my mind is the Wokers, Customers and Jobs tables. The tables of workers and customer and linked through the jobs table as both require something in relation to it. For example, a Customer creates a job and a worker completes it. Therefor they're connected through the the Jobs table and mainly the 'user id'. Attached to both Customer and Worker tables is also customer and worker review tables that is coonected by a 'review id'.

13. Describe your project’s models in terms of the relationships (active record associations) they have with each other.

14. Provide your database schema design.
ActiveRecord::Schema.define(version: 2019_05_08_015239) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "customer_reviews", force: :cascade do |t|
    t.string "content"
    t.string "description"
    t.bigint "customer_id"
    t.bigint "worker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_customer_reviews_on_customer_id"
    t.index ["worker_id"], name: "index_customer_reviews_on_worker_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "firstname"
    t.string "lastname"
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "jobs", force: :cascade do |t|
    t.string "description"
    t.string "title"
    t.bigint "customer_id"
    t.bigint "worker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price"
    t.boolean "accepted", default: false
    t.index ["customer_id"], name: "index_jobs_on_customer_id"
    t.index ["worker_id"], name: "index_jobs_on_worker_id"
  end

  create_table "worker_reviews", force: :cascade do |t|
    t.string "content"
    t.string "description"
    t.bigint "customer_id"
    t.bigint "worker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_worker_reviews_on_customer_id"
    t.index ["worker_id"], name: "index_worker_reviews_on_worker_id"
  end

  create_table "workers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "experience"
    t.string "description"
    t.string "firstname"
    t.string "lastname"
    t.string "username"
    t.index ["email"], name: "index_workers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_workers_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end

15. Provide User stories for your App.
customer@gmail.com added a job title, "mow the lawn" with a price of 60$ attached to it.
Worker@gmail.com signed in and looked at the jobs index page and found said job. After worker clicks the accept button the customer goes over to his page and pays for the job. 

16. Provide Wireframes for your App.
Attached in the project folder.

17. Describe the way tasks are allocated and tracked in your project.
The way we split up our tasks begun through the use of trello boards. We listed the pre-production tasks to the full production and then spread out the work evenly.  
We begun by splitting up the device controller coding. One did worker and the other did customer. As we progressed the trello boards where moved from 'To do' to 'Doing' and finally to the completed section.

18. Discuss how Agile methodology is being implemented in your project.
Although having not talked about agile metology, looking back and reflecting it seems like the methodology was actually still involved. 

19. Provide an overview and description of your Source control process.
To do this we used git hub to track our changes to code. I few times throughout the project we had issues of code not suddenly not working. Github gave us a solution as we filtered through old commits to fine the change that created the issue and from there we can continue debugging. 

20. Provide an overview and description of your Testing process.
Using incognito firefox pages I signed into two accounts. One customer and One worker. I ran through the necessary steps to test whether the whole transaction worked out. This required the creation of a job on the customer end, the acceptance of said job from the worker end, checking the terminal to make sure emails where being sent, being able to pay using stripe. Many other tests included updates of profiles and jobs, and creation of profiles and jobs.

21. Discuss and analyse requirements related to information system security.
The user information is stored in our database but not all information is shown to unncessary people. No address' will be involved. And the plan was to implement a chat system to avoid phone numbers. All information will be kept private. Only full names will be shown from your private information.


22. Discuss methods you will use to protect information and data.
To protect imporetant information we stashed out important key's in a .env file that was added to .gitignore. This means none of our keys will be pushed to github for people to locate and read.

23. Research what your legal obligations are in relation to handling user data.
Terms and conditions will establish the lengths to which we can handle user data. 