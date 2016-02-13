# betolerant

[![NPM Version][npm-image]][npm-url]
[![Build Status][travis-image]][travis-url]

```javascript
let betolerant = require("betolerant");

betolerant(3 /*tries*/, 10000 /*timeout*/, function* {
    yield asyncOp();
    yield sleep(1000);
    result = yield checkAsyncOpResult();
    if (!result.failed) {
        throw Error("op failed");
    }
}).then(function(){
    // done;
}).catch(function(){
    // all three attemps timed out or failed
});
```

[npm-image]: https://img.shields.io/npm/v/betolerant.svg?style=flat
[npm-url]: https://npmjs.org/package/betolerant
[travis-image]: https://img.shields.io/travis/zweifisch/betolerant.svg?style=flat
[travis-url]: https://travis-ci.org/zweifisch/betolerant
