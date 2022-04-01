After testing various gems to create an OTP based login, i went with the devise gem and the devise-passwordless gem, which builds upon devise's code. Instead of sending an OTP which the user can copy and paste into an input field, he/she now receives a link via mail which directly logs him in.
Since there is no OTP input page, i created a redirect page, that gives further information concerning the login link.

I also tried implementing a single input field for email or username. It was working in the sense that a magic link was generated and sent to the right user email. But out of some reason the Warden authentication middleman that devise is heavily relying on didn't accept the generated magic links. For more clarity, please see the branch "email_or_username_login".

The sign up now also needs confirmation also via a confirmation link that is sent via email.

All the mails are sent in development through the STMP service provider Sendgrid. 
