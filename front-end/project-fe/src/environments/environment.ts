// This file can be replaced during build by using the `fileReplacements` array.
// `ng build --prod` replaces `environment.ts` with `environment.prod.ts`.
// The list of file replacements can be found in `angular.json`.

export const environment = {
  production: false,
  api_news: 'http://localhost:8080/api/news',
  auth_api: 'http://localhost:8080/api/auth',
  user_api: 'http://localhost:8080/api/user',
  apiEmployee: 'http://localhost:8080/api/employee',
  api_url: 'http://localhost:8080/api/animal',
  // For Firebase JS SDK v7.20.0 and later, measurementId is optional
  firebaseConfig : {
    apiKey: 'AIzaSyDRbMhDSkNPSbvXWXiU4Kl_md6yHvQ4a2g',
    authDomain: 'sprint-1-a1221i1.firebaseapp.com',
    projectId: 'sprint-1-a1221i1',
    storageBucket: 'sprint-1-a1221i1.appspot.com',
    messagingSenderId: '829613950863',
    appId: '1:829613950863:web:e75c7f7f84817ead052dfa',
    measurementId: 'G-ES91XE6FCD'
  }
};

/*
 * For easier debugging in development mode, you can import the following file
 * to ignore zone related error stack frames such as `zone.run`, `zoneDelegate.invokeTask`.
 *
 * This import should be commented out in production mode because it will have a negative impact
 * on performance if an error is thrown.
 */
// import 'zone.js/dist/zone-error';  // Included with Angular CLI.
