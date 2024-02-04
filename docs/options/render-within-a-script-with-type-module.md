### Render with a script whose type is module

The charts are rendered by inserting a <script> block in the HTML. 
In order to generate this <script> with `type="module"` use the
option `module: true`.

```erb
<%= line_chart series, module: true %>
```
