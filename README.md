# 人生无限知识库 · 虚拟产品专题 Skills

这份交付包包含 **14 个应用 Skill**，覆盖研究、定位、选品、产品设计、指南写作、商品页与内容创作；另附 **2 个共享工具 Skill**：商业系统连接底座 `ai-life-system-init` 和中文写作检查工具 `humanizer-zh`。`skills/` 下共 16 个可安装目录，每个目录的根部都有 `SKILL.md`。

买家配套使用的是自己的 **Notion 商业系统工作台**。本仓库不包含任何买家的 Notion 页面、资料正文或登录凭证。Notion／ima 知识库的阅读权限、Agent 对知识库的连接权限，以及商业系统的写入权限需要分别取得；安装本仓库不会自动授予这些权限。

## 安装

### 交给 Agent 安装

将这个仓库交给支持 `SKILL.md` 的 Agent，并告诉它：

> 请安装本仓库 `skills/` 下的 16 个 Skill 目录。先检查本机是否已有同名 Skill；有冲突时保留原件备份，再安装此包。每个目录应直接包含 `SKILL.md`。不要把本仓库的 `skills/` 外层目录当作一个 Skill。不要上传或共享我的本地配置、Notion token、商业记录。

具体安装目录由所用 Agent 决定。不同 Agent 的 Skill 目录和调用规则可能不同；`SKILL.md` 文件格式兼容不等于它已经接入 Notion 或 ima。

### Codex 本地安装

在仓库根目录运行 `bash install.sh`，默认安装到 `${CODEX_HOME:-$HOME/.codex}/skills`。已有同名目录时脚本会在**复制前停止**；人工核对后可运行 `bash install.sh --replace`，旧目录会移动到技能目录旁的备份文件夹。也可用 `bash install.sh --target <你的技能目录>` 指定其他 Agent 的 Skill 目录。

安装后可用 `$user-avatar-coach`、`$product-opportunity-coach` 等英文名调用；中文展示名见下表。

## 首次连接商业系统

1. 在 Notion 复制课程提供的商业系统工作台到**自己的工作区**，并让当前 Agent 的 Notion 连接只获得你愿意开放的页面权限。
2. 调用 `$ai-life-system-init`，提供你自己的**商业系统首页链接**，明确说“使用商业系统单独模式”。这个首页是结构发现的锚点；不需要完整人生系统 Hub。
3. 底座只读取页面与数据库结构，按实际发现建立本地索引 `~/.commercial-system/`。若某个数据库只出现在链接视图中，可补充其原数据库链接。不在聊天中粘贴 Notion token。
4. 初始化后，业务 Skill 从此索引解析定位、内容、用户画像、产品等目标，并在云端重新读取当前记录。业务 Skill 如要保存结果，仍会检查目标与字段并遵循你的当次授权。

完整人生系统使用原有 `~/.ai-life-system/` 索引；商业系统索引独立存放，不应互相覆盖。你可以只提供材料而暂不连接 Notion，直接使用不依赖工作台的 Skill；需要数据库读写的步骤会说明缺口。

## 14 个应用 Skill

| 阶段 | 中文名 | 调用名 | 最小输入 |
| --- | --- | --- | --- |
| 研究 | 博主蒸馏助手 | `$blogger-distiller` | 合法取得的公开内容或导出数据 |
| 研究 | 用户画像助手 | `$user-avatar-coach` | 用户原话、行为、反馈或商业系统记录 |
| 研究 | 评论区商机挖掘 | `$comment-opportunity` | 评论数据与原帖语境 |
| 定位 | 商业定位专家 | `$commercial-positioning-coach` | 个人条件、目标用户和现实证据 |
| 选品 | 一人公司选品助手 | `$one-person-product-selection` | 背景、可复用经验或产品想法 |
| 选品 | 产品机会助手 | `$product-opportunity-coach` | 具体想法、用户问题和已有证据 |
| 设计 | 产品架构专家 | `$product-architecture-coach` | 已确认的机会、交付对象和目标 |
| 设计 | 产品体验专家 | `$product-experience-coach` | 现有产品路径、页面与反馈 |
| 交付 | 指南写作助手 | `$personal-guide-writer` | 作者经验、读者任务和资料来源 |
| 销售 | 商品详情页专家 | `$product-detail-page-design` | 真实交付内容、样品和适用边界 |
| 内容 | 公众号创作专家 | `$wechat-article-writing-coach` | 观点、经历、资料和读者问题 |
| 内容 | 朋友圈创作专家 | `$wechat-moments-writing-coach` | 真实场景、产品信息或草稿 |
| 内容 | 小红书创作专家 | `$xiaohongshu-native-note-coach` | 图片／场景、观点和证据 |
| 决策 | 大师视角 | `$master-perspective` | 具体决策、时间窗口、现实约束及可访问的人物资料 |

不需要按表格顺序全部调用。先选当前任务；研究输出可存到商业系统，内容 Skill 可以读取其中已经核实的资料。人物智囊、书籍、个人故事和文风样稿来自你有权访问的知识库或由你自己提供，**不是商业系统工作台内置的必填数据库**。

## 文件与权限边界

- `skills/` 只包含可交付的通用方法、参考资料和确定性脚本，不包含作者私人 Notion 页面 ID、账号配置、朋友圈样稿或客户数据。
- `~/.commercial-system/`、`~/.ai-life-system/` 是每位使用者本机产生的索引目录，不属于仓库文件。不要提交它们、临时发现 JSON、`.env` 或密钥。
- `ai-life-system-init` 只负责结构发现、解析和写入预检；它不会自行创建或修改商业记录。只读的产品架构与产品体验 Skill 也不会自动写回。
- 知识库内的文章、书籍和课程有各自的访问与使用范围。本仓库交付的是工作方法，不把这些内容复制进公开代码仓库。

首次使用可以先试一句：“用 `$user-avatar-coach` 根据我提供的五条真实用户反馈做一版画像，标出事实和假设，不写入 Notion。”
