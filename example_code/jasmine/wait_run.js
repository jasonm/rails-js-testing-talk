describe('Spreadsheet', function() {
  it('should calculate the total asynchronously', function () {
    var spreadsheet = new Spreadsheet();
    spreadsheet.fillWith(lotsOfFixtureDataValues());
    spreadsheet.asynchronouslyCalculateTotal();

    waitsFor(function() {
      return spreadsheet.calculationIsComplete();
    }, "Spreadsheet calculation never completed", 10000);

    runs(function () {
      expect(spreadsheet.total).toEqual(123456);
    });
  });
});

describe('Another example', function() {
  it('sequences runs and waits serially', function () {
    runs(function () {
      this.foo = 0;
      var that = this;
      setTimeout(function () {
        that.foo++;
      }, 250);
    });

    runs(function () {
      // Run immediately after prior runs()
      expect(this.foo).toEqual(0);
    });

    waits(500);

    runs(function () {
      // By this time, the setTimeout has executed
      expect(this.foo).toEqual(1);
    });
  });
});
