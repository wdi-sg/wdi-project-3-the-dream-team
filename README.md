# whichcraft

whichcraft is a full-stack web web application that combines front end (HTML, CSS, Javascript) with back end technologies (Ruby on Rails in this case).  Our team used Materialize, Google's responseive CSS framework to help build our site.

## Our Pitch
We wanted to create a platform to bring people who make fine crafts (crafters) and people who appreciate their products (henceforth known as crafteeeeees) together.  Through whichcraft, crafters would be able to showcase their crafts via a customizable portfolio, offer their services to the community through our event management feature, as well as access payment services.  Craftees would be able to search, obtain and enjoy bespoke services from the finest of craftsmen.

This idea was inspired by the growing art industry in Singapore, and recognizing the lack of a proper online platform for creatives to expose their works.  Skilled craftsmen in Singapore currently do not really have a centralized digital platform for them to display and share their crafts and services.  Their services are usually made known through word-of-mouth (which people seem to like and trust!  More so than Google searches).  Our platform seeks to help craftsmen to promote their expertise in their craft and have opportunities for inter-disciplinary networking.  Hopefully it would also help the local community to uncover hidden gems and enjoy unique products and services.

## Getting Started
If you'd like to help out with this application, go to our [github](https://github.com/wdi-sg/wdi-project-3-the-dream-team) page.  Fork or clone it into your computer.  Open the repository in your editor and run bundle install......anything else????


## Development
We spent a fair bit of time coming up with our **E**ntity **R**elationship **D**iagram because we knew we would have quite a fair number of models.  After a number of iterations, our ERD is as follows:
![Entity Relationship Diagram](https://github.com/wdi-sg/wdi-project-3-the-dream-team/blob/master/erd_diagram.png)

Because of our the large number of controllers and models, we also started a spreadsheet to track all koreign keys in each table in our database, and the methods associated with the instances.  
![Models](https://github.com/wdi-sg/wdi-project-3-the-dream-team/blob/master/modelsAndForeignKeys.png)

We also came up with wireframes to help us visualize the flow of our routes and get sensing of what we wanted our website to look like.
![Wireframes](https://github.com/wdi-sg/wdi-project-3-the-dream-team/blob/master/profilepage.png)
![Wireframes](https://github.com/wdi-sg/wdi-project-3-the-dream-team/blob/master/crafter.png)
![Wireframes](https://github.com/wdi-sg/wdi-project-3-the-dream-team/blob/master/newevent.png)
![Wireframes](https://github.com/wdi-sg/wdi-project-3-the-dream-team/blob/master/bookings.png)


## User Flow:
Users are able to view the 
- homepage
- events index page
- individual event page 
- crafters index page
- individual crafters' profile page
- portfolios index page

Beyond that, users would either have to register or login to create their profile, create thei portfolio, join events, leave reviews, make payment, and favorite events.  

### Noteworthy Point 1
On the backend, we decided to split the user's account into two accounts  - crafter's account and craftee's account.  Each user would thus have also have a crafter and craftee id, in addition to their own user id.  Crafters would be able to create events, while only craftees would be able to join events.  We rationalized by keeping the crafter and craftee accounts separate, it would make it easier to retrieve information associated with event organizers, attendees, and subsequent payments.  As such, we had to customize our devise sessions accordingly.  

### Noteworthy Point 2
To avoid having a many-to-many relationship between two tables (aka the Craftee and Events table), we also created a booking table that holds the craftee_id and event_id to remove the many-to-many dependency.  

### Noteworthy Point 3
We wanted to make it convenient for crafters to organize recurring events.  Hence, we came up with the concept of events and sessions.  For the same event, a crafter could organize multiple sessions and avoid retyping the same information for the same event over and over again.  We also wanted the craftees (i.e. the attendees) to have a good overview of the events they had already paid for. Hence the craftee's profile provides a calendar whereby their confirmed events are rendered accordingly.  

### Noteworthy Point 4
Searching was a MVP for our web app.  AJAX Filtering and Search and Auto-Complete [TOM PLEASE COMPLETE]


### Noteworthy Point 5
Stripe-connect API for multi-seller [RAYMOND PLEASE COMPLETE]


## Working with the UX Team
We were fortunate enough to work with three students from the UX class that was ongoing simultaneously.  Gavin, Angela and Rachel offered to partner with us on this project.  WDI UX for offering to work with us and helping us grasp a better understanding of user interaction on apps.  They also helped steer our discussion of who our target audience would be whether we should be crafter-centric/craftee-centric/scheduling-centric etc. This aided us in our decision making process how to structure our website.
 

## Further Developments
We hope to be able to implement a marketplace in addition to event scheduling so users crafters can have a platform to market their goods and other users would be able to purchase them directly.  Other developments include Google Maps API, Facebook Login, as well as a Chat room with ActionCable.


## Makers
Raymond, Tom Shue Ze and Shirong


## References and Acknowledgments:
* http://materializecss.com/
* https://github.com/excid3/simple_calendar
* https://material.io/icons/


