module NewsletterTags
  include Radiant::Taggable
  
  tag 'newsletter' do |tag|
    tag.expand
  end
  
  tag "newsletter:form" do |tag|
    tag.attr['id'] ||= 'newsletter'
    results = []
    action = "/newsletters/"
    results << %(<form action="#{action}" method="post" #{newsletter_attrs(tag)}>)
    results << %(<input name="authenticity_token" type="hidden" value="#{response.instance_variable_get(:@session)[:_csrf_token]}" />)
    results <<   tag.expand
    results << %(</form>)
  end
  
  
  def newsletter_attrs(tag, extras={})
    attrs = {
      'accept' => nil,
      'accesskey' => nil,
      'alt' => nil,
      'autocomplete' => nil,
      'autofocus' => nil,
      'checked' => nil,
      'class' => nil,
      'contextmenu' => nil,
      'dir' => nil,
      'disabled' => nil,
      'height' => nil,
      'hidden' => nil,
      'id' => tag.attr['name'],
      'lang' => nil,
      'max' => nil,
      'maxlength' => nil,
      'min' => nil,
      'pattern' => nil,
      'placeholder' => nil,
      'size' => nil,
      'spellcheck' => nil,
      'step' => nil,
      'style' => nil,
      'tabindex' => nil,
      'title' => nil,
      'width' => nil}.merge(extras)
    result = attrs.collect do |k,v|
      v = (tag.attr[k] || v)
      next if v.blank?
      %(#{k}="#{v}")
    end.reject{|e| e.blank?}
    result << %(name="newsletter[#{tag.attr['name']}]") unless tag.attr['name'].blank?
    result.join(' ')
  end
  
  def add_required(result, tag)
    result << %(<input type="hidden" name="newsletter[required][#{tag.attr['name']}]" value="#{tag.attr['required']}">) if tag.attr['required']
    result
  end
  
end