describe("App.Views.Members.BasicInfo", function() {
  var view, $el, member;

  beforeEach(function() {
    member = new App.Models.Member(this.fixtures.Models.Members.tim);
    view   = new App.Views.Members.BasicInfo({ model: member });
    $el    = $(view.el);
  });

  describe('Viewing the member headline', function() {
    it('should render an empty headline', function() {
      view.render();
      expect($el).toHaveText(/Add Headline/);
    });

    it('should render a new headline when the member is updated.', function() {
      view.render();
      member.set({"headline":"Loves the churros"});
      expect($el).toHaveText(/Loves the churros/);
    });
  });
});
