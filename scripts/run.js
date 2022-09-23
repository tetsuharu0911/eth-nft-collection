// runjs
const main = async () => {
    // コントラクトがコンパイルします
    // コントラクトを扱うために必要なファイルが、'artifacts'ディレクトリ直下に生成されます。
    const nftContractFactory = await hre.ethers.getContractFactory("MyEpicNFT");
    // HardhatがローカルのEthereumネットワークを作成します。
    const nftContract = await nftContractFactory.deploy();
    // コントラクトがMintされ、ローカルのブロックチェーンにデプロイされるまで待ちます。
    await nftContract.deployed();
    console.log("Contract deployed to:", nftContract.address);
    // makeAnEpicNFT関数を呼び出す。NFTがMintされる。
    let txn = await nftContract.makeAnEpicNFT();
    // Mintingが仮想マイナーにより、承認されるのを待つ
    await txn.wait();
    // makeAnEpicNFT関数をもう一度呼び出す。NFTがまたMintされる。
    txn = await nftContract.makeAnEpicNFT();
    // Mintingが仮想マイナーにより、承認されるのを待つ
    await txn.wait();
};

// エラー処理を行っています。
const runMain = async () => {
    try {
        await main();
        process.exit(0);
    } catch (error) {
        console.log(error);
        process.exit(1);
    }
};

runMain();