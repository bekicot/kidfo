angular.module('app.routes', ['ionicUIRouter'])

.config(function($stateProvider, $urlRouterProvider) {

  // Ionic uses AngularUI Router which uses the concept of states
  // Learn more here: https://github.com/angular-ui/ui-router
  // Set up the various states which the app can be in.
  // Each state's controller can be found in controllers.js
  $stateProvider
    
  

      /* 
    The IonicUIRouter.js UI-Router Modification is being used for this route.
    To navigate to this route, do NOT use a URL. Instead use one of the following:
      1) Using the ui-sref HTML attribute:
        ui-sref='tabsController.kIDFO'
      2) Using $state.go programatically:
        $state.go('tabsController.kIDFO');
    This allows your app to figure out which Tab to open this page in on the fly.
    If you're setting a Tabs default page or modifying the .otherwise for your app and
    must use a URL, use one of the following:
      /page1/tab1/home
      /page1/tab8/home
  */
  .state('tabsController.kIDFO', {
    url: '/home',
    views: {
      'tab1': {
        templateUrl: 'templates/kIDFO.html',
        controller: 'kIDFOCtrl'
      },
      'tab8': {
        templateUrl: 'templates/kIDFO.html',
        controller: 'kIDFOCtrl'
      }
    }
  })

  .state('pROFILE', {
    url: '/userprofile',
    templateUrl: 'templates/pROFILE.html',
    controller: 'pROFILECtrl'
  })

  /* 
    The IonicUIRouter.js UI-Router Modification is being used for this route.
    To navigate to this route, do NOT use a URL. Instead use one of the following:
      1) Using the ui-sref HTML attribute:
        ui-sref='tabsController.sitterProfile'
      2) Using $state.go programatically:
        $state.go('tabsController.sitterProfile');
    This allows your app to figure out which Tab to open this page in on the fly.
    If you're setting a Tabs default page or modifying the .otherwise for your app and
    must use a URL, use one of the following:
      /page1/tab6/userprofileview
      /page1/tab9/userprofileview
  */
  .state('tabsController.sitterProfile', {
    url: '/userprofileview',
    views: {
      'tab6': {
        templateUrl: 'templates/sitterProfile.html',
        controller: 'sitterProfileCtrl'
      },
      'tab9': {
        templateUrl: 'templates/sitterProfile.html',
        controller: 'sitterProfileCtrl'
      }
    }
  })

  .state('tabsController.kidProfile', {
    url: '/page10',
    views: {
      'tab2': {
        templateUrl: 'templates/kidProfile.html',
        controller: 'kidProfileCtrl'
      }
    }
  })

  .state('tabsController.kidFavorites', {
    url: '/page12',
    views: {
      'tab2': {
        templateUrl: 'templates/kidFavorites.html',
        controller: 'kidFavoritesCtrl'
      }
    }
  })

  .state('tabsController.kids', {
    url: '/page9',
    views: {
      'tab2': {
        templateUrl: 'templates/kids.html',
        controller: 'kidsCtrl'
      }
    }
  })

  .state('coOp', {
    url: '/co-op',
    templateUrl: 'templates/coOp.html',
    controller: 'coOpCtrl'
  })

  .state('sits', {
    url: '/page16',
    templateUrl: 'templates/sits.html',
    controller: 'sitsCtrl'
  })

  .state('tabsController.createSitSitters', {
    url: '/sits/new',
    views: {
      'tab8': {
        templateUrl: 'templates/createSitSitters.html',
        controller: 'createSitSittersCtrl'
      }
    }
  })

  .state('tabsController.createSitDetails', {
    url: '/page13',
    views: {
      'tab8': {
        templateUrl: 'templates/createSitDetails.html',
        controller: 'createSitDetailsCtrl'
      }
    }
  })

  .state('tabsController.summary', {
    url: '/createsitsummary',
    views: {
      'tab8': {
        templateUrl: 'templates/summary.html',
        controller: 'summaryCtrl'
      }
    }
  })

  .state('sitDetails', {
    url: '/sitdetailsforsitter',
    templateUrl: 'templates/sitDetails.html',
    controller: 'sitDetailsCtrl'
  })

  .state('tabsController.sitCreated', {
    url: '/page15',
    views: {
      'tab8': {
        templateUrl: 'templates/sitCreated.html',
        controller: 'sitCreatedCtrl'
      }
    }
  })

  .state('tabsController', {
    url: '/page1',
    templateUrl: 'templates/tabsController.html',
    abstract:true
  })

  .state('login', {
    url: '/page5',
    templateUrl: 'templates/login.html',
    controller: 'loginCtrl'
  })

  .state('signUp', {
    url: '/page18',
    templateUrl: 'templates/signUp.html',
    controller: 'signUpCtrl'
  })

  /* 
    The IonicUIRouter.js UI-Router Modification is being used for this route.
    To navigate to this route, do NOT use a URL. Instead use one of the following:
      1) Using the ui-sref HTML attribute:
        ui-sref='tabsController.network'
      2) Using $state.go programatically:
        $state.go('tabsController.network');
    This allows your app to figure out which Tab to open this page in on the fly.
    If you're setting a Tabs default page or modifying the .otherwise for your app and
    must use a URL, use one of the following:
      /page1/tab6/family
      /page1/tab9/family
  */
  .state('tabsController.network', {
    url: '/family',
    views: {
      'tab6': {
        templateUrl: 'templates/network.html',
        controller: 'networkCtrl'
      },
      'tab9': {
        templateUrl: 'templates/network.html',
        controller: 'networkCtrl'
      }
    }
  })

  .state('invites', {
    url: '/page11',
    templateUrl: 'templates/invites.html',
    controller: 'invitesCtrl'
  })

  /* 
    The IonicUIRouter.js UI-Router Modification is being used for this route.
    To navigate to this route, do NOT use a URL. Instead use one of the following:
      1) Using the ui-sref HTML attribute:
        ui-sref='tabsController.profile'
      2) Using $state.go programatically:
        $state.go('tabsController.profile');
    This allows your app to figure out which Tab to open this page in on the fly.
    If you're setting a Tabs default page or modifying the .otherwise for your app and
    must use a URL, use one of the following:
      /page1/tab1/me
      /page1/tab8/me
      /page1/tab6/me
      /page1/tab9/me
  */
  .state('tabsController.profile', {
    url: '/me',
    views: {
      'tab1': {
        templateUrl: 'templates/profile.html',
        controller: 'profileCtrl'
      },
      'tab8': {
        templateUrl: 'templates/profile.html',
        controller: 'profileCtrl'
      },
      'tab6': {
        templateUrl: 'templates/profile.html',
        controller: 'profileCtrl'
      },
      'tab9': {
        templateUrl: 'templates/profile.html',
        controller: 'profileCtrl'
      }
    }
  })

  .state('fEED', {
    url: '/feed',
    templateUrl: 'templates/fEED.html',
    controller: 'fEEDCtrl'
  })

  /* 
    The IonicUIRouter.js UI-Router Modification is being used for this route.
    To navigate to this route, do NOT use a URL. Instead use one of the following:
      1) Using the ui-sref HTML attribute:
        ui-sref='tabsController.familyProfile'
      2) Using $state.go programatically:
        $state.go('tabsController.familyProfile');
    This allows your app to figure out which Tab to open this page in on the fly.
    If you're setting a Tabs default page or modifying the .otherwise for your app and
    must use a URL, use one of the following:
      /page1/tab6/familyprofile
      /page1/tab9/familyprofile
  */
  .state('tabsController.familyProfile', {
    url: '/familyprofile',
    views: {
      'tab6': {
        templateUrl: 'templates/familyProfile.html',
        controller: 'familyProfileCtrl'
      },
      'tab9': {
        templateUrl: 'templates/familyProfile.html',
        controller: 'familyProfileCtrl'
      }
    }
  })

$urlRouterProvider.otherwise('/page1/tab6/familyprofile')

  

});