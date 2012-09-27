// Generated by CoffeeScript 1.3.3
(function() {

  this.Parser = (function() {

    function Parser(html) {
      this.html = html;
    }

    Parser.prototype.stripTags = function() {
      return this.html.match(/<\/?[^>]+>/gi);
    };

    Parser.prototype.wellFormed = function() {
      var stack, tag, tags, _i, _len;
      tags = this.stripTags();
      stack = new Stack;
      for (_i = 0, _len = tags.length; _i < _len; _i++) {
        tag = tags[_i];
        if (this.openingTag(tag)) {
          stack.push(tag);
        } else if (this.closingTag(tag)) {
          if (this.matchingTags(stack.viewTop(), tag)) {
            stack.pop();
          } else {
            return false;
          }
        }
      }
      return true;
    };

    Parser.prototype.openingTag = function(tag) {
      return tag.match(/<[^\/][^>]*>/) !== null;
    };

    Parser.prototype.closingTag = function(tag) {
      return tag.match(/<\/[^>]+>/) !== null;
    };

    Parser.prototype.matchingTags = function(openTag, closeTag) {
      if (this.openingTag(openTag) && this.closingTag(closeTag)) {
        return this.tagName(openTag) === this.tagName(closeTag);
      } else {
        return false;
      }
    };

    Parser.prototype.tagName = function(tag) {
      return tag.match(/[a-z0-9]+(?=>|\s)/)[0];
    };

    return Parser;

  })();

}).call(this);
