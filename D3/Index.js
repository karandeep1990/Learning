var graph = {
  "Ver":"2","lineageType":"MSS","lineageStartPoint":"LCR Top 16",
  "idMap": {
    "a": "application",
    "n": "entity",
    "l": "element",
    "d": "logicalRule",
    "c": "control",
    "m": "metric"
  },
  "nodesInfo":{
    "a1": {"id": "a1", "name": "a1", "gk": 1},
    "a2": {"id": "a2", "name": "a2", "gk": 1},
    "a3": {"id": "a3", "name": "a3", "gk": 1},
    "a4": {"id": "a4", "name": "a4", "gk": 1},
    "n1": {"id": "n1", "name": "n1", "gk": 1},
    "n2": {"id": "n2", "name": "n2", "gk": 1},
    "n3": {"id": "n3", "name": "n3", "gk": 1},
    "n4": {"id": "n4", "name": "n4", "gk": 1},
    "l1": {"id": "l1", "name": "l1", "gk": 1},
    "l2": {"id": "l2", "name": "l2", "gk": 1},
    "l3": {"id": "l3", "name": "l3", "gk": 1},
    "l4": {"id": "l4", "name": "l4", "gk": 1},
    "d1": {"id": "d1", "name": "d1", "gk": 1},
    "c1": {"id": "c1", "name": "c1", "gk": 1},
    "c2": {"id": "c2", "name": "c1", "gk": 1},
    "m1": {"id": "m1", "name": "m1", "gk": 1}
  },
  "nodes": [
    {"id":"m1", "node":"m1", "childNodes": ["n1-m1","n4-m1"], "pos": 3},
    {"id":"a1", "node":"a1", "childNodes": ["n1-a1","n2-a1"], "pos": 1},
    {"id":"a2", "node":"a2", "childNodes": ["n3-a2","n4-a2"], "pos": 1},
    {"id":"a3", "node":"a3", "childNodes": ["n1-a3","n3-a3"], "pos": 2},
    {"id":"n1-m1", "node":"n1", "childNodes": ["l1-n1-m1","l2-n1-m1", "d1-n1-m1"], "pos": 1},
    {"id":"n2-a1", "node":"n2", "childNodes": ["l1-n2-a1","l2-n2-a1"], "pos": 1},
    {"id":"n1-a1", "node":"n1", "childNodes": ["l1-n1-a1","l2-n1-a1"], "pos": 1},
    {"id":"n3-a2", "node":"n3", "childNodes": ["l1-n3-a2","l2-n3-a2"], "pos": 1},
    {"id":"n4-a2", "node":"n4", "childNodes": ["l1-n4-a2","l2-n4-a2"], "pos": 1},
    {"id":"n3-a3", "node":"n3", "childNodes": ["l3-n3-a3","l2-n3-a3"], "pos": 1},
    {"id":"n1-a3", "node":"n1", "childNodes": ["l3-n1-a3","l2-n1-a3"], "pos": 1},
    {"id":"n4-m1", "node":"n4", "childNodes": ["l3-n4-m1","l2-n4-m1"], "pos": 1},
    {"id":"l1-n1-m1", "node":"l1", "pos": 1, "grpId": "1"},
    {"id":"l2-n1-m1", "node":"l2", "pos": 1, "grpId": "2"},
    {"id":"d1-n1-m1", "node":"d1", "pos": 1, "controls": ["c1","c2"], "dataGovernanceDimension":"", "controlCoverage":""},
    {"id":"l1-n2-a1", "node":"l1", "pos": 1, "grpId": "1"},
    {"id":"l2-n2-a1", "node":"l2", "pos": 2, "grpId": "2"},
    {"id":"l1-n1-a1", "node":"l1", "pos": 2, "grpId": "2"},
    {"id":"l2-n1-a1", "node":"l2", "pos": 2, "grpId": "2"},
    {"id":"l1-n3-a2", "node":"l1", "pos": 2, "grpId": "2"},
    {"id":"l2-n3-a2", "node":"l2", "pos": 2, "grpId": "2"},
    {"id":"l1-n4-a2", "node":"l1", "pos": 2, "grpId": "2"},
    {"id":"l2-n4-a2", "node":"l2", "pos": 2, "grpId": "2"},
    {"id":"l3-n3-a3", "node":"l3", "pos": 1, "grpId": "2"},
    {"id":"l2-n3-a3", "node":"l2", "pos": 1, "grpId": "2"},
    {"id":"l3-n1-a3", "node":"l3", "pos": 1, "grpId": "2"},
    {"id":"l2-n1-a1", "node":"l2", "pos": 1, "grpId": "2"},
    {"id":"l3-n4-m1", "node":"l3", "pos": 1, "grpId": "2"},
    {"id":"l2-n4-m1", "node":"l2", "pos": 1, "grpId": "2"}
  ],
  "edges": [
      {"id": 1, "start":"a1","target":"a3"},
      {"id": 1, "start":"a2","target":"a3"},
      {"id": 1, "start":"a1","target":"a4"},
      {"id": 1, "start":"a3","target":"m5"},
      {"id": 1, "start":"a4","target":"m5"},
      {"id": 1, "start":"n1-a1","target":"n1-a3"},
      {"id": 1, "start":"n2-a1","target":"n2-a3"},
      {"id": 1, "start":"n3-a2","target":"n2-a3"},
      {"id": 1, "start":"n1-a4","target":"n1-a4"},
      {"id": 1, "start":"l1-n1-a1","target":"l1-n1-m3"}
    ]
}

// TODO requires es5-shim and es6-shim

// request a more optimized array from service where children are already filled in

// optimize choice, replace id with array index or id with actual object, sill save me 1+ for loops
// this id terrible

function setupNode(node, graph){
  var idArr = node.id.split("-")
  node.nodeId = idArr.splice(0,1);
  node.parentId = idArr.join("-");//rest of ids joined
  node.assetTypeShort = node.id.charAt(0);
  node.assetType = graph["idmap"][node.assetTypeShort];
  node.name = graph["nodesInfo"][node.nodeId].name;
  node.gk = graph["nodesInfo"][node.nodeId].gk;

  node.sourceOfEdgesIdx = graph.edges.reduce(function(arr, edge, i, edges){
    if (node.id == edge.source) {
      arr.push(i);
    }
    return arr;
  }, []);
  node.targetOfEdgesIdx = graph.edges.reduce(function(arr, edge, i, edges){
    if (node.id == edge.target) {
      arr.push(i);
    }
    return arr;
  });
}

var t0 = performance.now();
var graphNodesArrLen = graph.nodes.length;
function optimizeNode(node, graph){
  if(!node.isOptimized){
    var nodesLookupArr = graph.nodes;
    setupNode(node, graph);

    if (node.childNodes){
      for (var i = 0, len = childNodes.length; i < len; i++){
        var j = nodesLookupArr.findIndex(function(element, i, arr){ //TODO i can switch this find to a loopup loop if i can get array indexes
          optimizeNode(element, nodesLookupArr); // optomize even non-matched nodes. save future loops because of optimized check
          return childNodes[i] == element.id;
        })
        childNodes[i] = nodesLookupArr.splice(j,1)[0];//also slow
        graphNodesArrLen--;
        //TODO sort childNodes by pos
      }
    }
    node.isOptimized = true;
  }
}
for (var x = 0; x < graphNodesArrLen; x++){
  optimizeNode(graph.nodes[x], graph);
}
//TODO sort nodes here by pos
var t1 = performance.now();

console.log(t1-t0);

/*
OR convert all to map... not sure if this is better
*/

var t0 = performance.now();
graph.nodesMap = {}
for (var x = 0, len = graph.nodes.length; x < len; x++){
  graph.nodesMap[graph.nodes[x].id] = graph.nodes[x];
}
function optimizeNode(node, graph){
  if (!node.isOptimized){
    setupNode(node, graph);
    if (node.childNodes){
      for (var i = 0, len = childNodes.length; i < len; i++){
        optimizeNode(graph.nodesMap[childNodes[i]]);
        childNodes[i] = graph.nodesMap[childNodes[i]];
      }
    }
    node.isOptimized = true;
  }
}
for (var x = 0; x < graph.nodes.length; x++){
  optimizeNode(graph.nodes[x], graph);
}
var t1 = performance.now();


console.log(t1-t0);


// define inits, services, factories
var svg = d3.select("#svg");//must select a parent first

var assetLevelMap = {
  0: ["application", "metric"],
  1: ["entity"],
  2: ["element", "logicalRule"]
}

var filters = {
  nodeLevelMap: assetLevelMap,
  nodeLevel: 0,
  expandedNodes: {}
}

var baseNodeRenderer = function baseNodeRenderer(node, dataObj, index, filter){

}

var assetTypeRendererMap = {//can be from a factory
  "application": function(node, dataObj, index, filter){},
  "entity": function(node, dataObj, index, filter){},
  "metric": function(node, dataObj, index, filter){},
  "element": function(node, dataObj, index, filter){},
  "logicalRule": function(node, dataObj, index, filter){},
}

drawElementsAndTrackConfig(svg, graph, filters);

function drawElementsAndTrackConfig(parent, data, filter){
    drawNodes(parent, data.nodes, filter);
    drawEdges(d3Ctx, data.edges, filter);
    return dataCtx;
}

function drawNodes(d3Ctx, nodes, filter){
  var d3Ctx = d3Ctx.selectAll("rect")//create placeholders if none
    .data(nodes)
    .enter()
    .append("rect")
    .each(configureNode);

    d3Ctx.exit().remove();
  return d3Ctx;
}

var configureNode = function configureNode(d, i){
  var node = this;
  var d3Node = d3.select(this);

  curNode.attr("childNodes",  d.childNodes);
  curNode.attr("nodeId", d.nodeId);
  curNode.attr("assetType", d.assetType);
  curNode.attr("id", d.id);
  d.element = d3Node;
  curNode.attr("arrayIdx", i);
  curNode.attr("arrayIdxChain", i + (d3Ctx.attr("arrayIdxChain") ? "-" + d3Ctx.attr("arrayIdxChain") : "");

  if (d.childNodes && filter.expandedNodes[d.id]){
    filter.nodeLevel++;
    drawNodes(d3Node, d.childNodes, filter);
    filter.nodeLevel--;
  }

  //events, custom rendering, props, highlights go in these functions
  baseNodeRenderer(d3Node, d, i, filter);
  assetTypeRendererMap[d.assetType](d3Node, d, i, filter);
}

function drawEdges(d3Ctx, edges, filter){

}
