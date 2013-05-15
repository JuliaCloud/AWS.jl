
import Base.Test.@test

########

tstr = """
<doc>
<src ref="moo">
<![CDATA[
    Since this is a CDATA section
    I can use all sorts of reserves characters
    like > < " and &
    or write things like
    <foo></bar>
    but my document is still well formed!
]]>
</src>
<dest id="foo">1234</dest>
<boo ref="boo"/>
</doc>"""

require("../src/XML.jl")
using .lx, .dom

lx.xmlKeepBlanksDefault(0)
doc = dom.XMLDoc(xmlstring = tstr)

childnodes = dom.childNodes(doc.root)

@test length(childnodes) == 3
@test lx.xname(lx.xsearch(doc.root, "dest", false)[1]) == "dest"
