chai = require 'chai'
chai.use require "chai-as-promised"
chai.should()
{expect} = chai
{sleep} = require "promised-util"

betolerant = require './index'

describe 'betolerant', ->

    it "should just pass", ->
        betolerant 3, 1, ->
            "pass"
        .should.eventually.equal "pass"

    it "should fail", ->
        betolerant 2, 1, ->
            throw Error "Failure"
        .should.be.rejected

    it "should timeout", ->
        betolerant 2, 1, ->
            yield sleep 5
        .should.be.rejected

    it "should not timeout", ->
        betolerant 2, 10, ->
            yield sleep 5
        .should.be.resolved

    it "should try 4 times", ->
        list = [1, 1, 1, 1]
        betolerant 4, 1, ->
            list.pop()
            throw Error "Not Empty" if list.length
            list
        .should.eventually.deep.equal []

    it "should try 3 times", ->
        list = [1, 1, 1, 1]
        betolerant 3, 1, ->
            list.pop()
            throw Error "Not Empty" if list.length
            list
        .should.be.rejected

    it "should try a lot of times", ->
        list = [1, 1, 1, 1]
        betolerant 0, 1, ->
            list.pop()
            throw Error "Not Empty" if list.length
            list
        .should.eventually.deep.equal []
