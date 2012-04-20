describe("PubSub", function() {
  it("should call subscribers", function() {
    var spy = sinon.spy();

    PubSub.subscribe("message", spy);
    PubSub.publishSync("message", undefined);

    expect(spy).toHaveBeenCalled();
  });
});
