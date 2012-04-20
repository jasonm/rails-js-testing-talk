describe("Given comments are present on the server", function() {
  beforeEach(function() {
    this.server = sinon.fakeServer.create();

    this.server.respondWith(
      "GET", "/some/article/comments.json",
      [200, { "Content-Type": "application/json" },
      '[{ "id": 12, "comment": "Hey there" }]'
     );
  });

  afterEach(function() {
    this.server.restore();
  });

  it("should fetch comments from server", function () {
    var callback = sinon.spy();
    myLib.getCommentsFor("/some/article", callback);
    this.server.respond();

    assert(callback.calledWith([{ id: 12, comment: "Hey there" }]));
  });
});
