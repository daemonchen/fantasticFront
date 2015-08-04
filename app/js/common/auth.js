// Login API

var riot = require('riot');

var DB = require('./store.js');

var INTERFACE = require('./interface.js')

var auth = riot.observable();

var nzaomAuthDB = DB('nzaom-auth-info');

auth.userObj = nzaomAuthDB.get();

auth.userObj.xPlatform = 'h5';

/*
    userObj = {
        returnUrl: '',
        xAuthToken: '',
        xPlatform: 'h5',
        isLogin: false

    }
*/
auth.login = function(params) {
  $.ajax({
    type: "POST",
    url: INTERFACE.login,
    data: JSON.stringify(params),
    success: function(response, status, xhr) {
      if (response.code != '2000' && response.msg) {
        auth.trigger('login-fail', response)
        alert(response.msg);
        return
      }
      auth.userObj.isLogin = true;
      auth.userObj.xAuthToken = response.result;
      auth.setAjax();
      nzaomAuthDB.put(auth.userObj);
      auth.trigger('login-success', response);
    },
    error: function(XMLHttpRequest, textStatus, errorThrown) {
      auth.trigger('login-fail', response)
    }
  })
}

auth.register = function(params) {
  $.ajax({
    type: "POST",
    url: INTERFACE.register,
    data: JSON.stringify(params),
    success: function(response, status, xhr) {
      if (response.code != '2000' && response.msg) {
        auth.trigger('register-fail', response)
        alert(response.msg);
        return
      };
      auth.userObj.isLogin = true;
      auth.userObj.xAuthToken = response.result;
      auth.setAjax();
      nzaomAuthDB.put(auth.userObj);
      auth.trigger('register-success', response);
    },
    error: function(XMLHttpRequest, textStatus, errorThrown) {
      auth.trigger('register-fail', response)
    }
  })
}

auth.cleanAuth = function() {
  auth.userObj.isLogin = false;
  auth.userObj.xAuthToken = '';
  auth.setAjax();
  nzaomAuthDB.put(auth.userObj);
}

auth.setAjax = function() { //如果接口需要登录，需要调用一次，以确保总是能够拿到最新的xAuthToken
  if ($.ajaxSetup) {
    $.ajaxSetup({
      beforeSend: function(xhr) {
        xhr.setRequestHeader('X-Request-With', null)
        // xhr.setRequestHeader('x-platform', 'H5')
        // xhr.setRequestHeader('x-auth-token', auth.userObj.xAuthToken || '')
      },
      xhrFields: {
        withCredentials: true
      },
      crossDomain: true,
      dataType: "json",
      contentType: 'application/json'
    });
  } else {
    $.ajaxSettings = $.extend($.ajaxSettings, {
      beforeSend: function(xhr) {
        xhr.setRequestHeader('X-Request-With', null)
        // xhr.setRequestHeader('x-platform', 'H5')
        // xhr.setRequestHeader('x-auth-token', auth.userObj.xAuthToken || '')
      },
      xhrFields: {
        withCredentials: true
      },
      crossDomain: true,
      dataType: "json",
      contentType: 'application/json'
        // whatever
    });
  }
}

auth.setXauthToken = function(token) {
  this.userObj.isLogin = true;
  this.userObj.xAuthToken = token;
  this.setAjax();
  nzaomAuthDB.put(this.userObj);
  if (!!this.userObj.returnUrl) {
    riot.route(this.userObj.returnUrl)
  } else {
    riot.route('home')
  }
}

riot.mixin('auth', auth);

module.exports = auth;