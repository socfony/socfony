import { NestJS } from '~deps';
import { ConfigModule } from '../../config';
import { tencentCloudConfig } from './tencent-cloud.config';

const config = ConfigModule.forFeature(tencentCloudConfig);

@NestJS.Common.Module({
  imports: [config],
  exports: [config],
})
export class TencentCloudModule {}
