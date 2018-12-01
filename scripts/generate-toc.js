#!/usr/bin/env node

const mdContents = require('markdown-contents')
const fs = require('fs')
const path = require('path')
const { pipe, map, reduce, replace, curry } = require('ramda')

const resolvePath = (...paths) => path.resolve(__dirname, '..', ...paths)
const pathToReadme = resolvePath('README.md')
const readFile = file => fs.readFileSync(file, 'utf-8')
const writeFile = (file, content) => fs.writeFileSync(file, content, { encoding: 'utf-8' })
const readDocFile = name => {
  const file = resolvePath('docs', `${name}.md`)
  return readFile(file)
}
const retrieveMarkdownTree = md => mdContents(md).tree()
const treeToMarkdown = tree => mdContents.treeToMarkdown(tree)
const pathToDocs = doc => `docs/${doc}.md`
const generateAnchors = curry((doc, content) => replace(/\(\#(.+)\)/g, `(${pathToDocs(doc)}#$1)`, content))

const docs = ['second', 'hour', 'day']
const retrieveMarkdownOf = pipe(
  readDocFile,
  retrieveMarkdownTree,
  treeToMarkdown,
)
const generateToC = pipe(
  map(doc => {
    const content = retrieveMarkdownOf(doc)
    return generateAnchors(doc, content)
  }),
  reduce((acc, toc) => `${acc}${toc}`, ''),
)
const saveReadme = content => {
  const readmeContent = readFile(pathToReadme)
  const newReadmeContent = replace(
    /\<\!\-\- TOC\:START.+\-\-\>(\n.+)+\n+\<\!\-\- TOC:END \-\-\>/gm,
    `<!-- TOC:START - Do not remove or modify this section -->\n${content}<!-- TOC:END -->`,
    readmeContent
  )
  writeFile(pathToReadme, newReadmeContent)
}
const generateToCAndSaveReadme = pipe(
  generateToC,
  saveReadme,
)

generateToCAndSaveReadme(docs)
