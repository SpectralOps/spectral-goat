const Sentry = require('@sentry/node');
// or use es6 import statements
// import * as Sentry from '@sentry/node';

// All integrations that come with an SDK can be found on the Sentry.Integrations object
// Custom integrations must conform Integration interface: https://github.com/getsentry/sentry-javascript/blob/master/packages/types/src/index.ts

Sentry.init({
  dsn: 'https://34272539600044d894552d62c814f98a@o409427.ingest.sentry.io/53406046666677777777777777',
  integrations: [new MyAwesomeIntegration()]
});
