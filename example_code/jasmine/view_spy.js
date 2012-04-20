describe('Views.Tasks.New', function() {
  var $el, task, view;

  beforeEach(function() {
    task = new App.Models.Task({id: 1});
    view = new App.Views.Tasks.New({model: task});
  });

  describe('Creating a task', function() {
    it("should submit the headline form when you press 'enter'", function() {
      var saveMethod = sinon.spy(view.model, "save");

      view.render();
      view.$('form').trigger('submit');
      expect(saveMethod).toHaveBeenCalled();
    });

    it("should render the show view when you press 'esc'", function() {
      var cancelMethod = sinon.stub(view, "hide");
      var e = $.Event('keyup', { which: 27 });

      view.render();
      view.$('form').trigger(e);
      expect(cancelMethod).toHaveBeenCalled();
    });
  });
});
