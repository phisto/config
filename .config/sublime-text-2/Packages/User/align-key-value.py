import sublime, sublime_plugin

SEPARATOR = ':|=>'

class KeyValueAlignCommand(sublimeplugin.TextCommand):
   def run(self, view, args):
      maxKeyLen = max([max([len(k) for k in dict([[s.rstrip() for s in re.split(SEPARATOR, line, 1)] for line in view.substr(region).split("\n")]).keys()]) for region in view.sel()])
      for region in view.sel():
         lines = view.substr(region).split("\n")
         padded = []
         for line in lines:
            key = re.split(SEPARATOR, line, 1)[0]
            padded.append(line.replace(key, key.rstrip().ljust(maxKeyLen + 1)))
         view.replace(region, "\n".join(padded))