// Import the functions you need from the SDKs you need
const { initializeApp } = require("firebase/app");
const { getAnalytics } = require("firebase/analytics");
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyBOXcKU6D106x1-P8jXcvaN9_woY-4Y0Kc",
  authDomain: "designo-5706d.firebaseapp.com",
  projectId: "designo-5706d",
  storageBucket: "designo-5706d.appspot.com",
  messagingSenderId: "291738544922",
  appId: "1:291738544922:web:061a15f4bedf799e1a1aa3",
  measurementId: "G-BLB4L9JRXV"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);