importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-messaging.js");

firebase.initializeApp({
  apiKey: "AIzaSyCZ1lFhZCjYsn0M9Gn6q3sv7lwGTkhadyM",
  authDomain: "schooly-72888.firebaseapp.com",
  databaseURL: "https://schooly-72888-default-rtdb.firebaseio.com",
  projectId: "schooly-72888",
  storageBucket: "schooly-72888.appspot.com",
  messagingSenderId: "167633407726",
  appId: "1:167633407726:web:cdad2a7126317c5f5c6dff",
});

const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((message) => {
  console.log("onBackgroundMessage", message);
});