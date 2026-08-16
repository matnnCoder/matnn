// ============================================================
// 28.4 - 损失函数 + 优化器
// 损失：MSE / CrossEntropy / BCE
// 优化器：SGD / Adam
// ============================================================
Console.log("====== 28.4 损失函数 & 优化器 ======\n");

// ------------------------------
// 1. MSELoss
// ------------------------------
Console.log("--- MSELoss ---");
var mse = Nn.mseLoss();
var pred = Tensor.zeros([5]);
pred.set(0, 1.0); pred.set(1, 2.0); pred.set(2, 3.0); pred.set(3, 4.0); pred.set(4, 5.0);
var targ = Tensor.zeros([5]);
targ.set(0, 1.2); targ.set(1, 1.8); targ.set(2, 3.1); targ.set(3, 3.9); targ.set(4, 5.0);
var mseLoss = mse.forward(pred, targ);
var mseVal = mseLoss.toList()[0];
Console.log("pred = " + pred.toList());
Console.log("targ = " + targ.toList());
Console.log("MSE = mean((pred-targ)^2) = " + mseVal + "  (expect ~0.014)");

// ------------------------------
// 2. BCELoss
// ------------------------------
Console.log("\n--- BCELoss ---");
var bce = Nn.bceLoss();
var logit = Tensor.zeros([3]);
logit.set(0, -3.0); logit.set(1, 0.0); logit.set(2, 3.0);
var p = logit.sigmoid();
var label = Tensor.zeros([3]);
label.set(2, 1.0);
var bceLoss = bce.forward(p, label);
Console.log("logit      = " + logit.toList());
Console.log("sigmoid(p) = " + p.toList());
Console.log("label      = " + label.toList());
Console.log("BCE = " + bceLoss.toList()[0]);

// ------------------------------
// 3. CrossEntropyLoss
// ------------------------------
Console.log("\n--- CrossEntropyLoss ---");
var cel = Nn.crossEntropyLoss();
var logitsA = Tensor.zeros([2, 3]);
logitsA.set(0, 0, 1.0); logitsA.set(0, 1, 2.0); logitsA.set(0, 2, 3.0);
logitsA.set(1, 0, 3.0); logitsA.set(1, 1, 1.0); logitsA.set(1, 2, 0.0);
var labelA = Tensor.zeros([2]);
labelA.set(0, 2.0); labelA.set(1, 0.0);
var celLoss = cel.forward(logitsA, labelA);
Console.log("case A (target class idx): loss = " + celLoss.toList()[0]);

var oneHot = Tensor.zeros([2, 3]);
oneHot.set(0, 2, 1.0);
oneHot.set(1, 0, 1.0);
var celBH = cel.forward(logitsA, oneHot);
Console.log("case B (target one-hot):   loss = " + celBH.toList()[0] + "  (same as A)");

// ------------------------------
// 4. SGD / Adam 优化器接口
// ------------------------------
Console.log("\n--- SGD / Adam 优化器接口 ---");
var regressor = Nn.sequential(
    Nn.linear(3, 5),
    Nn.relu(),
    Nn.linear(5, 1)
);

var sgd = Nn.sgd(regressor.parameters(), 0.01, 0.9, 1e-4);
var adam = Nn.adam(regressor.parameters(), 0.001, 0.9, 0.999, 1e-8);

Console.log("Optimizers created:");
Console.log("  NnSGD  className: " + sgd._className);
Console.log("  NnAdam className: " + adam._className);

var loopTmpl =
    "\n  Typical training loop (template):\n" +
    "  for epoch in 0..EPOCHS do:\n" +
    "      opt.zeroGrad(model)\n" +
    "      var logits = model.forward(x)\n" +
    "      var loss = criterion.forward(logits, y)\n" +
    "      [note] loss.backward()   <-- enable once autograd is ready\n" +
    "      opt.step(model)\n" +
    "      Console.log(\"epoch loss \" + loss)\n";
Console.log(loopTmpl);

Console.log("\n====== 28.4 完成 ======");
